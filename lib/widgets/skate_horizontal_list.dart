import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_skate/details.dart';
import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/sharded/global.dart';
import 'package:flutter/material.dart';
import 'package:e_skate/sharded/global.dart' as globals;

class SkateHorizontalList extends StatelessWidget {
  final Stream<QuerySnapshot<Object?>> skates;
  const SkateHorizontalList({super.key, required this.skates});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: skates,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LinearProgressIndicator(
              color: Color(0xffFF914D),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'The skates you like will appear here.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
          }
          // List likedSkateList = [];
          List likedSkateList = listSkateIcon(
              context,
              snapshot.data?.docs
                  .map((skate) => Skate.fromSnapshot(skate))
                  .toList());
          return Container(
              margin: const EdgeInsets.only(top: 15, left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Loved ones',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: likedSkateList.length,
                        itemBuilder: (context, index) {
                          return likedSkateList[index];
                        },
                      ),
                    )
                  ]));
        });
  }

  List<Widget> listSkateIcon(BuildContext context, List<Skate>? listSkate) {
    List<Widget> list = [];
    if (listSkate != null) {
      for (var skate in listSkate) {
        list.add(buildImage(context, skate));
      }
    }
    return list;
  }

  Widget buildImage(BuildContext context, Skate skate) {
    final image = NetworkImage(skate.urls.first);
    return Container(
      margin: const EdgeInsets.all(5),
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.all(2),
          color: globalColor,
          child: ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: image,
                fit: BoxFit.cover,
                width: 92,
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return DetailsPage(skate: skate);
                        },
                        fullscreenDialog: true))
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
