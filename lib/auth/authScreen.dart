import 'package:country_picker/country_picker.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                      context: context,
                      onSelect: (value) {
                        print("You selected ${value.name}");
                      });
                },
                child: Text("Click me"))
          ],
        ),
      )),
    );
  }
}
