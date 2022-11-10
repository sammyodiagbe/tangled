import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

enum AuthState { Authenticated, NotAuthenticated }

class AuthService extends ChangeNotifier {
  var authState = AuthState.NotAuthenticated;
  AuthUser? user;

  Future<void> getUser() async {
    try {
      final usr = await Amplify.Auth.getCurrentUser();
      user = usr;
      authState = AuthState.Authenticated;
      notifyListeners();
    } catch (err) {}
  }

  Future<bool> createAccount(String name, String email, String password) async {
    try {
      var createAccount = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(
          userAttributes: <CognitoUserAttributeKey, String>{
            CognitoUserAttributeKey.email: email,
            CognitoUserAttributeKey.name: name
          },
        ),
      );
      if (createAccount.isSignUpComplete) {
        return true;
      }
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<void> VerifyOTP(String email, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: confirmationCode);
      authState = AuthState.Authenticated;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future<bool> SignUserIn(String email, String password) async {
    try {
      final signIn =
          await Amplify.Auth.signIn(username: email, password: password);
      if (signIn.isSignedIn) {
        authState = AuthState.Authenticated;
        notifyListeners();
        return true;
      }
    } catch (err) {
      print(err);
    }
    return false;
  }

  Future<void> signOut() async {
    try {
      final signout = await Amplify.Auth.signOut();
      authState = AuthState.NotAuthenticated;
      user = null;
      notifyListeners();
    } catch (err) {}
  }
}
