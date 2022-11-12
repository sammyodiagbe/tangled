import "package:flutter/material.dart";

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/dating_image.png', fit: BoxFit.contain),
            Text(
              'Tangled',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )),
      ),
    );
  }
}
