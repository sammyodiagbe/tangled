import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Home'),
      ),
      body: Center(
        child: Row(
          children: [
            Text("Welcome home"),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Provider.of<AuthService>(context, listen: false).signOut();
              },
              child: Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
