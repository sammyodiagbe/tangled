import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Click me and see what happens"),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthService>(context, listen: false).SignUserIn();
              },
              child: Text("Click me"),
            )
          ],
        ),
      ),
    );
  }
}
