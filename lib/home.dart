import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/authWrapper.dart';
import 'package:tangled/services/authService.dart';

class Home extends StatelessWidget {
  static final id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome home"),
            SizedBox(height: 15),
            Text(Provider.of<AuthService>(context).user!.username),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () async {
                final logout =
                    await Provider.of<AuthService>(context, listen: false)
                        .signOut();
                if (logout) {
                  Navigator.pushNamed(context, AuthWrapper.id);
                }
              },
              child: Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
