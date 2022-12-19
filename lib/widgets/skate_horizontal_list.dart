import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_skate/pages/details_page.dart';
import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/sharded/global.dart';
import 'package:flutter/material.dart';

class SkateHorizontalList extends StatelessWidget {
  final Stream<QuerySnapshot<Object?>> skates;
  final String libelle;
  final String emptyCaseString;
  const SkateHorizontalList(
      {super.key,
      required this.skates,
      required this.emptyCaseString,
      required this.libelle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(libelle,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          StreamBuilder<QuerySnapshot>(
              stream: skates,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const LinearProgressIndicator(
                    color: Color(0xffFF914D),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        emptyCaseString,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
                List likedSkateList = listSkateIcon(
                    context,
                    snapshot.data?.docs
                        .map((skate) => Skate.fromSnapshot(skate))
                        .toList());
                return Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: likedSkateList.length,
                        itemBuilder: (context, index) {
                          return likedSkateList[index];
                        },
                      ),
                    ));
              }),
        ],
      ),
    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DetailsPage(skate: skate);
                          },
                          fullscreenDialog: true),
                    )
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
