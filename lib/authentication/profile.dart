import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_skate/authentication/auth_service.dart';
import 'package:e_skate/authentication/widgets/profile_image_widget.dart';
import 'package:e_skate/repository/data_repository.dart';
import 'package:e_skate/sharded/global.dart';
import 'package:e_skate/widgets/skate_horizontal_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        LikedSkateList_GetUser("owned"),
        const SizedBox(height: 20),
        LikedSkateList_GetUser("liked"),
      ],
    );
  }

  void signOut() {
    AuthService auth = AuthService();
    auth.logOut();
  }

  Widget LikedSkateList_GetUser(String typeList) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LinearProgressIndicator(
              color: Color(0xffFF914D),
            );
          }
          if (typeList == "liked") {
            return LikedSkateList(snapshot.data);
          } else {
            return LovedSkateList(snapshot.data);
          }
        });
  }

  Widget LikedSkateList(User? currentUser) {
    DataRepository repository = DataRepository();
    return SkateHorizontalList(
        libelle: 'Loved Ones',
        emptyCaseString: 'The skates you like will appear here.',
        skates: repository.skates
            .where('likes', arrayContains: currentUser!.uid)
            .snapshots());
  }

  Widget LovedSkateList(User? currentUser) {
    DataRepository repository = DataRepository();
    return SkateHorizontalList(
        libelle: 'My Skates',
        emptyCaseString: 'The skates you own will appear here',
        skates: repository.skates
            .where('owners', arrayContains: currentUser!.uid)
            .snapshots());
  }
}
