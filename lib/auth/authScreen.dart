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
        child: Column(
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
      )),
    );
  }
}
