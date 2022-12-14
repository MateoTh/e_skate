import 'package:e_skate/authentication/login.dart';
import 'package:e_skate/authentication/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? Login(onclickedRegister: toggle)
      : Register(onclickedLogin: toggle);

  void toggle() {
    isLogin = !isLogin;
    setState(() {});
  }
}
