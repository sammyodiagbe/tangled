import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

enum AuthState { Authenticated, NotAuthenticated }

class AuthService extends ChangeNotifier {
  var authState = AuthState.NotAuthenticated;

  Future<AuthUser?> get user async {
    try {
      final usr = await Amplify.Auth.getCurrentUser();
      return usr;
    } catch (err) {}
    return null;
  }

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(
          userAttributes: <CognitoUserAttributeKey, String>{
            CognitoUserAttributeKey.email: email,
          },
        ),
      );
      print("done signing you up");
    } catch (err) {
      print(err);
    }
  }

  Future<void> VerifyOTP(String mobile, String confirmationCode) async {
    try {
      await Amplify.Auth.confirmSignUp(
          username: mobile, confirmationCode: confirmationCode);
      authState = AuthState.Authenticated;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void SignUserIn() {
    authState = AuthState.Authenticated;
    notifyListeners();
  }

  void signOut() {
    authState = AuthState.NotAuthenticated;
    notifyListeners();
  }
}
