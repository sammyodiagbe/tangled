import 'package:flutter/foundation.dart';

enum AuthState { Authenticated, NotAuthenticated }

class AuthService extends ChangeNotifier {
  var authState = AuthState.NotAuthenticated;

  void SignUserIn() {
    authState = AuthState.Authenticated;
    notifyListeners();
  }

  void signOut() {
    authState = AuthState.NotAuthenticated;
    notifyListeners();
  }
}
