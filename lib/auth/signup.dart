// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tangled",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff312F2F),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "After providing your phone number, we would send you an OTP to verify.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff312F2F),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "What should we call you?",
                  hintStyle: TextStyle(fontSize: 14),
                  filled: true,
                  fillColor: Color(0xffEDF2F4),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (value) {},
                spaceBetweenSelectorAndTextField: 5,
                inputDecoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEDF2F4),
                    hintStyle: TextStyle(fontSize: 14),
                    hintText: "Phone number",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Create account",
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
            ],
          ),
        ),
      ),
    ));
  }
}
