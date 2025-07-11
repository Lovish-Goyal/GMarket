import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:utils_widget/utils_widget.dart';
import '../../../data/env.dart';
import '../../../utils/apiclient.dart';
import 'user_model/user_model.dart';
part 'provider.g.dart';

@Riverpod(keepAlive: true)
class UserState extends _$UserState {
  @override
  UserModel? build() => null;

  /// SIGN UP METHOD
  Future<String> signUp({
    required UserModel user,
    required String password,
  }) async {
    try {
      await ApiClient.account.create(
        email: user.email,
        password: password,
        name: user.fullName,
        userId: user.userId,
      );
      await ApiClient.account.createEmailPasswordSession(
        email: user.email,
        password: password,
      );
      HapticFeedback.lightImpact();
      await ApiClient.account.updatePrefs(prefs: user.toJson());

      if (user.phone.isNotEmpty) {
        logger.v("Phone Number Updating ${user.phone}");
        updateUserPhone(user.phone, password);
      }
      await ApiClient.database.createDocument(
        databaseId: Env.mainDatabaseId,
        collectionId: "64818336279e4e2077ac",
        documentId: user.userId,
        data: user.toJson(),
      );
      // await ApiClient.functions.createExecution(
      //   functionId: "Env.permissionFunctionId",
      //   data: jsonEncode({
      //     "databaseId": Env.mainDatabaseId,
      //     "collectionId": Env.userCollectionId,
      //     "documentId": user.userId,
      //     "permissions": user.permissions,
      //   }),
      // );
      return signIn(email: user.email, password: password);
    } on AppwriteException catch (e) {
      logger.e(e);
      return e.message ?? "Error Occurred";
    } catch (error) {
      logger.e(error);
      return "$error";
    }
  }

  /// SIGN IN METHOD
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await ApiClient.account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      final UserModel? currentUser = await getCurrentUser();
      if (currentUser != null) {
        state = currentUser;
      }
      return "";
    } on AppwriteException catch (e) {
      logger.e(e);
      return e.message ?? "Error Occurred";
    } catch (error) {
      logger.e(error);
      return "$error";
    }
  }

  /// SIGN OUT METHOD
  Future signOut() async {
    try {
      await ApiClient.account.deleteSession(sessionId: 'current');
      state = null;
    } on AppwriteException catch (e) {
      logger.e(e);
      state = null;
    }
  }

  /// GET CURRENT USER
  Future<model.User?> getCurrentAccount() async {
    try {
      model.User result = await ApiClient.account.get();
      // if (!result.emailVerification) {
      //   return null;
      // }
      return result;
    } on AppwriteException catch (error) {
      logger.e(error);
      state = null;
      return null;
    } catch (error) {
      logger.e(error);
      state = null;
      return null;
    }
  }

  /// GET CURRENT USER
  Future<UserModel?> getCurrentUser() async {
    logger.w("getCurrentUser on working");
    try {
      model.User? result = await getCurrentAccount();
      if (result == null) return null;
      final userData = await ApiClient.database.getDocument(
        databaseId: Env.mainDatabaseId,
        collectionId: "64818336279e4e2077ac",
        documentId: result.$id,
      );
      final user = UserModel.fromJson(userData.data);
      state = user;
      return user;
    } on AppwriteException catch (error) {
      logger.e(error);
      state = null;
      return null;
    } catch (error) {
      logger.e(error);
      state = null;
      return null;
    }
  }

  /// Upload user Image
  Future<bool> uploadUserImage(String imageId) async {
    try {
      model.User? result = await getCurrentAccount();
      if (result == null) return false;
      await ApiClient.database.updateDocument(
        databaseId: Env.mainDatabaseId,
        collectionId: "64818336279e4e2077ac",
        documentId: result.$id,
        data: {"image": imageId},
      );
      return true;
    } on AppwriteException catch (error) {
      logger.e(error);
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  /// Update all user fields in both Appwrite Account and Database
  Future<bool> updateUserDetails(UserModel updatedUser) async {
    try {
      // Update Appwrite Account: Name, Email, Phone
      if (updatedUser.fullName != state?.fullName) {
        await updateUserName(updatedUser.fullName);
      }
      if (updatedUser.email != state?.email) {
        await ApiClient.account.updateEmail(
          email: updatedUser.email,
          password: 'YOUR_VERIFICATION_PASSWORD', // Optional if needed
        );
      }
      if (updatedUser.phone.isNotEmpty && updatedUser.phone != state?.phone) {
        await updateUserPhone(updatedUser.phone, 'YOUR_VERIFICATION_PASSWORD');
      }

      // Update Appwrite Database (user collection)
      await ApiClient.database.updateDocument(
        databaseId: Env.mainDatabaseId,
        collectionId: "64818336279e4e2077ac",
        documentId: updatedUser.userId,
        data: updatedUser.toJson(),
      );

      // Optionally update preferences
      await ApiClient.account.updatePrefs(prefs: updatedUser.toJson());

      // Set new state
      state = updatedUser;

      logger.i("User updated successfully.");
      return true;
    } catch (e, st) {
      logger.e("Error updating user details $e and $st");
      showErrorNotice("Error", e.toString());
      return false;
    }
  }

  /// UPDATE USER PREFERENCES
  Future<model.User?> updateUserPre(UserModel user) async {
    try {
      model.User account = await ApiClient.account.updatePrefs(
        prefs: user.toJson(),
      );
      logger.v(user..toJson());
      return account;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<model.User?> updateUserName(String userName) async {
    try {
      model.User user = await ApiClient.account.updateName(name: userName);
      logger.v(user.toMap());
      return user;
    } catch (e) {
      logger.e(e);
      showErrorNotice("Error", e.toString());
      await Future.delayed(const Duration(seconds: 5), () {});
      return null;
    }
  }

  Future<model.User?> updateUserPhone(String phoneNumber, String pass) async {
    try {
      model.User user = await ApiClient.account.updatePhone(
        phone: phoneNumber,
        password: pass,
      );
      logger.v(user.toMap());
      return user;
    } on AppwriteException catch (e) {
      logger.e(e.message);
      showErrorNotice("Error", e.message ?? "Error Occurred while updating");
      await Future.delayed(const Duration(seconds: 5), () {});
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  /// Create phone session
  Future<model.Token?> createPhoneSession({
    required String phone,
    required String userId,
  }) async {
    try {
      // model.Token token = await ApiClient.account.createPhoneSession(
      //   phone: phone,
      //   userId: userId,
      // );
      model.Token token = await ApiClient.account.createPhoneToken(
        userId: userId,
        phone: phone,
      );

      logger.v(token.toMap());
      return token;
    } on AppwriteException catch (e) {
      logger.e(e.message);
      showErrorNotice("Error", e.message ?? "An error occurred, try again.");
      await Future.delayed(const Duration(seconds: 3), () {});
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  /// Verify phone session
  Future<bool> verifyPhoneSession({
    required String code,
    required String userId,
  }) async {
    try {
      model.Session session = await ApiClient.account.updatePhoneSession(
        secret: code,
        userId: userId,
      );
      logger.v(session.toMap());
      final UserModel? currentUser = await getCurrentUser();
      if (currentUser != null) {
        state = currentUser;
      }
      return true;
    } on AppwriteException catch (e) {
      logger.e(e.message);
      showErrorNotice("Error", e.message ?? "An error occurred, try again.");
      await Future.delayed(const Duration(seconds: 3), () {});
      return false;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}

class PhoneAuthModel {
  String? phone;
  String? code;
  model.Token? token;

  PhoneAuthModel({this.phone, this.code, this.token});
}

final phoneAuthModelProvider = StateProvider<PhoneAuthModel>(
  (ref) => PhoneAuthModel(),
);

@Riverpod(keepAlive: true)
class Admin extends _$Admin {
  @override
  bool build() => false;

  void setAdmin(bool isAdmin) {
    state = isAdmin;
  }
}
