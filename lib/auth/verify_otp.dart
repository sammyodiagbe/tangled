// ignore_for_file: prefer_const_constructors
import "package:flutter/material.dart";

class VerifyOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                "Enter OTP sent to +1 431 275 9924",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff312F2F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLength: 5,
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
                onPressed: () {},
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
    );
  }
}
