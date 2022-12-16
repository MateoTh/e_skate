import 'package:e_skate/authentication/auth_service.dart';
import 'package:e_skate/authentication/widgets/profile_image_widget.dart';
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
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ProfileImageWidget(
          imagePath:
              'https://scontent-cdt1-1.xx.fbcdn.net/v/t31.18172-8/14615688_1779733628964448_5341084844159348354_o.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=jiO77Hm8ldMAX8ezPcn&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCn32QEVrNJOrZ1AX3jIHcou_ltIGZgTqH6q4SJYjsp3w&oe=63C3B673',
          onClicked: () => {},
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            Text(
              user!.displayName != null ? user!.displayName! : 'Guest',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              user!.email != null ? user!.email! : 'email',
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: signOut,
                style: ElevatedButton.styleFrom(backgroundColor: globalColor),
                child: const Text('Sign Out'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text('My Skates',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'The skates you own will appear here',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Loved ones',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'The skates you like will appear here.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );

    //   return Center(
    //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       const Text(
    //         'Signed in as',
    //         style: TextStyle(fontSize: 16),
    //       ),
    //       Text(
    //         user!.email!,
    //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: 15,
    //       ),
    //
    //     ]),
    //   );
  }

  void signOut() {
    AuthService auth = AuthService();
    auth.logOut();
  }
}
