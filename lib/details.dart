import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/objects/video.dart';
import 'package:e_skate/repository/data_repository.dart';
import 'package:e_skate/sharded/global.dart';
import 'package:e_skate/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_skate/sharded/global.dart' as globals;
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.skate});
  final Skate skate;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.skate.brand} ${widget.skate.name}')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imagesCarousel(widget.skate.urls, 300),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getNote(widget.skate.rate, Icons.star, Icons.star_border, 30),
                LikeButton(skate: widget.skate)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Specs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (!await launchUrl(
                        Uri.parse(widget.skate.webSite),
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw 'Could not launch ${widget.skate.webSite}';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: globals.globalColor),
                    child: const Text('Check website')),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Row(children: [
              const Icon(Icons.speed),
              Text(' ${widget.skate.topSpeed} Km/h',
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ]),
            Row(children: [
              const Icon(Icons.earbuds),
              Text(' ${widget.skate.range} Km',
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ]),
            Row(children: [
              const Icon(Icons.attach_money),
              Text('${widget.skate.price}',
                  style: const TextStyle(fontWeight: FontWeight.bold))
            ])
          ]),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: const Text(
              'Ressources',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: VideoList_Mock.length,
                itemBuilder: ((context, index) {
                  return listTileYoutube(VideoList_Mock[index].urlId,
                      VideoList_Mock[index].name, VideoList_Mock[index].author);
                }),
                padding: const EdgeInsets.all(8)),
          )
        ],
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  final Skate skate;
  const LikeButton({super.key, required this.skate});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    DataRepository repository = DataRepository();
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return IconButton(
          onPressed: (() => {
                if (widget.skate.likes.contains(snapshot.data!.uid))
                  {
                    widget.skate.likes.remove(snapshot.data!.uid),
                    repository.skates.doc(widget.skate.uid).update({
                      'likes': FieldValue.arrayRemove([snapshot.data!.uid])
                    }),
                    setState(() => {})
                  }
                else
                  {
                    widget.skate.likes.add(snapshot.data!.uid),
                    repository.skates.doc(widget.skate.uid).update({
                      'likes': FieldValue.arrayUnion([snapshot.data!.uid])
                    }),
                    setState(() => {})
                  }
              }),
          icon: Icon(
              widget.skate.likes.contains(snapshot.data!.uid)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: globalColor,
              size: 30),
        );
      },
    );
  }
}
