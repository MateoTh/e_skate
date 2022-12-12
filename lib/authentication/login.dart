import 'package:e_skate/sharded/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return SignInScreen(
//       headerBuilder: (context, constraints, _) {
//         return Center(
//           child: Container(
//             margin: const EdgeInsets.only(top: 20),
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//                 image:
//                     const DecorationImage(image: AssetImage('assets/logo.png')),
//                 border: Border.all(color: Colors.white, width: 5),
//                 borderRadius: BorderRadius.circular(100),),
//           ),
//         );
//       },
//       providerConfigs: const [
//         EmailProviderConfiguration(),
//         // GoogleProviderConfiguration(
//         //   clientId:
//         //       '64029444217-si6c4dm423ievj3g15f22o5f1h2vf7v4.apps.googleusercontent.com',
//         // ),
//       ],
//     );
//   }
// }

class Login extends StatefulWidget {
  const Login({super.key});

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
    return Container(
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
            controller: loginController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          TextButton(
              child: const Text(
                'Forgot password ?',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {}),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: logIn,
            style: ElevatedButton.styleFrom(
                backgroundColor: globalColor,
                minimumSize: const Size.fromHeight(50)),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
