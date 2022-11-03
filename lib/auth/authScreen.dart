import 'package:country_pickers/country_pickers.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/services/authService.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CountryPickerDropdown(
                onValuePicked: (value) {},
                initialValue: "CA",
                itemBuilder: (country) {
                  return Row(
                    children: [
                      CountryPickerUtils.getDefaultFlagImage(country),
                      SizedBox(
                        width: 5,
                      ),
                      Text("+${country.phoneCode}")
                    ],
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
