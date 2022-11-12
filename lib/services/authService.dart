import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

enum AuthState { Authenticated, NotAuthenticated }

class AuthService extends ChangeNotifier {
  var authenticated = false;
  AuthUser? user;

  Future<bool> getUser() async {
    try {
      final usr = await Amplify.Auth.getCurrentUser();
      user = user;
      authenticated = true;
      notifyListeners();
      return true;
    } catch (err) {}
    return false;
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
      authenticated = true;
      print("Verification done");
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  Future<bool> SignUserIn(String email, String password) async {
    try {
      final signIn = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      if (signIn.isSignedIn) {
        user = await Amplify.Auth.getCurrentUser();
        authenticated = true;
        return true;
      }
    } catch (err) {
      print("Something went wrong hahahs..");
      print(err);
    }
    return false;
  }

  Future<bool> signOut() async {
    try {
      final signout = await Amplify.Auth.signOut();
      authenticated = false;
      return true;
    } catch (err) {}
    return false;
  }
}
