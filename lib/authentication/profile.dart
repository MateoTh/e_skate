import 'package:e_skate/sharded/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Signed in as',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          user!.email!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: signOut,
          style: ElevatedButton.styleFrom(backgroundColor: globalColor),
          child: const Text('SignOut'),
        )
      ]),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
