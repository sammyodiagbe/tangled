// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:tangled/auth/verify_otp.dart';
import 'package:tangled/services/authService.dart';

class Signup extends StatefulWidget {
  static final id = 'Signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailAddress = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _emailAddress.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, provider, child) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
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
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "We need a name to call you.";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "What should we call you?",
                          hintStyle: TextStyle(fontSize: 14),
                          filled: true,
                          fillColor: Color(0xffEDF2F4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // InternationalPhoneNumberInput(
                      //   onInputChanged: (value) {
                      //     String? number = value.phoneNumber;
                      //     _emailAddress.text = number ?? "";
                      //   },
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Phone number is required";
                      //     }
                      //   },
                      //   spaceBetweenSelectorAndTextField: 5,
                      //   inputDecoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Color(0xffEDF2F4),
                      //     hintStyle: TextStyle(fontSize: 14),
                      //     hintText: "Phone number",
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(8.0),
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        controller: _emailAddress,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field cannot be empty.";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email address",
                          hintStyle: TextStyle(fontSize: 14),
                          filled: true,
                          fillColor: Color(0xffEDF2F4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required.";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 14),
                          filled: true,
                          fillColor: Color(0xffEDF2F4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String email = _emailAddress.text;
                            String name = _usernameController.text;
                            String password = _passwordController.text;
                            provider
                                .createAccount(name, email, password)
                                .then((value) {
                              if (value) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VerifyOTP(email: email),
                                  ),
                                );
                              }
                            });
                          }
                        },
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
        ),
      ),
    );
  }
}
