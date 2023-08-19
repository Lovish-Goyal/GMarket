import 'package:appwrite/appwrite.dart';
import 'package:logger/logger.dart';
import 'package:utils_widget/utils_widget.dart';
import 'apiclient.dart';

//signup method
Future<String> signUp({
  required String email,
  required String password,
  required String name,
  required String userId,
  required String phone,
}) async {
  try {
    final user = await ApiClient.account.create(
      email: email,
      password: password,
      name: name,
      userId: userId,
    );
    Logger().v(user.toMap());
  } on AppwriteException catch (e) {
    logger.e(e.message);
    return e.message ?? "Error Occurred";
  } catch (error) {
    logger.e(error);
    return "$error";
  }
  return "";
}

///login method
Future<String> signIn({required String email, required String password}) async {
  try {
    final result = await ApiClient.account.createEmailSession(
      email: email,
      password: password,
    );
   // print(result.toMap());
    return result.$id;
  } on AppwriteException catch (error) {
    Logger().v(error);
   // print(error.message);
    return "$error";
  }
}
