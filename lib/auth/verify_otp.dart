// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key, required this.mobileNumber});

  final String mobileNumber;

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final _formKey = GlobalKey<FormState>();

  final _mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, provider, child) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
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
                  SizedBox(height: 20),
                  Text(
                    "Enter OTP sent to ${widget.mobileNumber}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff312F2F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _mobileController,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "00000",
                      hintStyle: TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: Color(0xffEDF2F4),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        provider.VerifyOTP(
                            widget.mobileNumber, _mobileController.text);
                      }
                    },
                    child: Text(
                      "Verify",
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
        ),
      ),
    );
  }
}
