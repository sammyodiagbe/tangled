//

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tangled/amplifyconfiguration.dart';
import 'package:tangled/services/authService.dart';

import 'authWrapper.dart';

_configureAmplify() async {
  try {
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([auth]);
    await Amplify.configure(amplifyconfig);
  } catch (error) {
    safePrint("Couldn't configure amplify $error");
  }
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configureAmplify();
  runApp(TangledApp());
}

class TangledApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
      ),
    );
  }
}
