//

import "package:flutter/material.dart";

import 'authWrapper.dart';

void main(List<String> args) {
  runApp(TangledApp());
}

class TangledApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthWrapper(),
    );
  }
}
