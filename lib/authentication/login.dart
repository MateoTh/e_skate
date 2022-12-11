import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      headerBuilder: (context, constraints, _) {
        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage('assets/logo.png')),
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(100)),
          ),
        );
      },
      providerConfigs: const [
        EmailProviderConfiguration(),
        // GoogleProviderConfiguration(
        //   clientId:
        //       '64029444217-si6c4dm423ievj3g15f22o5f1h2vf7v4.apps.googleusercontent.com',
        // ),
      ],
    );
  }
}
