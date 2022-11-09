import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

import 'auth/authScreen.dart';
import 'home.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authState = context.watch<AuthService>().authState;
    if (authState == AuthState.Authenticated) {
      return Home();
    }
    return AuthScreen();
  }
}
