// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";

class Signup extends StatelessWidget {
  static final id = 'Signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: Text(
                  "Tangled",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
