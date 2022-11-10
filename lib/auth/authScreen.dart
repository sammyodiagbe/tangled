// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:tangled/auth/signin.dart';
import 'package:tangled/auth/signup.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tangled",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Signin.id);
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffFF0054),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Signup.id);
                  },
                  child: Text("Create an account"),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Color(0xff312F2F),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffEDF2F4),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
