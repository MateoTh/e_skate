import 'package:e_skate/authentication/auth_service.dart';
import 'package:e_skate/authentication/forgot_password_page.dart';
import 'package:e_skate/sharded/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final VoidCallback onclickedRegister;
  const Login({super.key, required this.onclickedRegister});

  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image:
                    const DecorationImage(image: AssetImage('assets/logo.png')),
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              controller: loginController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                child: const Text(
                  'Forgot password ?',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage())),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: logIn,
              style: ElevatedButton.styleFrom(
                  backgroundColor: globalColor,
                  minimumSize: const Size.fromHeight(50)),
              child: const Text('Sign In'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onclickedRegister,
                    style: (const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                    text: 'Sign Up')
              ])),
            ),
          ],
        ),
      ),
    );
  }

  Future logIn() async {
    AuthService auth = AuthService();
    auth.logIn(context, loginController.text, passwordController.text);
  }
}
