import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/auth/signin.dart';
import 'package:tangled/services/authService.dart';

import 'auth/authScreen.dart';
import 'home.dart';

class AuthWrapper extends StatefulWidget {
  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late StreamSubscription<HubEvent> hubScription;
  @override
  void initState() {
    // TODO: implement initState\
    super.initState();
  }

  _getAuthUser() async {
    try {
      await Provider.of<AuthService>(context, listen: false).getUser();
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, provider, child) {
      if (provider.authenticated) {
        return Home();
      }
      return Signin();
    });
  }
}
