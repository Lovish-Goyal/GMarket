import 'dart:typed_data';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/widgets/custom_snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';
import '../../../../../utils/apiclient.dart';
import '../../../app/modules/auth/provider.dart';
import '../../../app/modules/auth/user_model/user_model.dart';
part 'provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  bool build() => false;

  updateProfilePicture(UserModel user, WidgetRef ref) async {
    state = true;
    final ImagePicker picker = ImagePicker();
    try {
      final response = await picker.pickImage(source: ImageSource.gallery);
      if (response != null) {
        final bytes = await response.readAsBytes();
        customInfoNotice("Uploading image...");
        await imageUpload(bytes, user, ref);
        customSuccessNotice("Image uploaded successfully");
      }
    } catch (e) {
      logger.e(e);
      state = false;
    }
    state = false;
  }

  FutureOr<String> imageUpload(
    Uint8List? image,
    UserModel user,
    WidgetRef ref,
  ) async {
    try {
      final result = await ApiClient.storage.createFile(
        bucketId: '6478beb17488d9d997b1',
        fileId: ID.unique(),
        file: InputFile.fromBytes(
          bytes: image?.toList() ?? [],
          filename:
              "${user.fullName.toString().replaceAllMapped(" ", (match) => "_")}_displayPicture.jpeg",
        ),
      );
      if (user.image.isNotEmpty) {
        try {
          await ApiClient.storage.deleteFile(
            fileId: user.image,
            bucketId: '6478beb17488d9d997b1',
          );
          user = user.copyWith(image: result.$id);
          await ApiClient.account.updatePrefs(prefs: user.toJson());
          await ref
              .read(userStateProvider.notifier)
              .uploadUserImage(result.$id);
          await ref.read(userStateProvider.notifier).getCurrentUser();
          return result.$id;
        } catch (e) {
          logger.e(e);
        }
      }
      user = user.copyWith(image: result.$id);
      await ApiClient.account.updatePrefs(prefs: user.toJson());
      await ref.read(userStateProvider.notifier).uploadUserImage(result.$id);
      await ref.read(userStateProvider.notifier).getCurrentUser();
      return result.$id;
    } catch (e) {
      logger.e(e);
    }
    return "";
  }
}
