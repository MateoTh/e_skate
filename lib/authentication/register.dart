import 'package:e_skate/sharded/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final VoidCallback onclickedLogin;
  const Register({super.key, required this.onclickedLogin});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              controller: loginController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                  backgroundColor: globalColor,
                  minimumSize: const Size.fromHeight(50)),
              child: const Text('Sign Up'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: RichText(
                  text: TextSpan(text: '', children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onclickedLogin,
                      style: (const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                    text: 'Sign In')
              ])),
            ),
          ],
        ),
      ),
    );
  }

  Future register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: loginController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
