//

import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

import 'authWrapper.dart';

void main(List<String> args) {
  runApp(TangledApp());
}

class TangledApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        home: AuthWrapper(),
      ),
    );
  }
}
