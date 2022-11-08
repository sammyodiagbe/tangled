import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

enum AuthState { Authenticated, NotAuthenticated }

class AuthService extends ChangeNotifier {
  var authState = AuthState.NotAuthenticated;

  Future<void> signUpWithMobile(
      String name, String mobile, String password) async {
    try {
      await Amplify.Auth.signUp(
        username: mobile,
        password: password,
        options: CognitoSignUpOptions(
          userAttributes: <CognitoUserAttributeKey, String>{
            CognitoUserAttributeKey.name: name,
            CognitoUserAttributeKey.email: "hello@test.mail"
          },
        ),
      );
      print("done signing you up");
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
