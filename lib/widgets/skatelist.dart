import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_skate/details.dart';
import 'package:e_skate/objects/skate.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SkateList extends StatefulWidget {
  const SkateList({super.key, required this.skates});
  final Stream<QuerySnapshot<Object?>> skates;

  @override
  State<SkateList> createState() => _SkateListState();
}

class _SkateListState extends State<SkateList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.skates,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LinearProgressIndicator(
            color: Color(0xffFF914D),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/logo.png')),
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.circular(100)),
              ),
              const Center(
                  child: Text(
                'No result',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ],
          );
        }
        return GridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          children: listCardSkate(
              context,
              snapshot.data!.docs
                  .map((skate) => Skate.fromSnapshot(skate))
                  .toList()),
        );
      },
    );
  }
}

List<Widget> listCardSkate(BuildContext context, List<Skate> list) {
  List<Widget> cards = [];
  for (var skate in list) {
    cards.add(cardSkate(skate, context));
  }
  return cards;
}

Widget cardSkate(Skate skate, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return DetailsPage(skate: skate);
          },
          fullscreenDialog: true));
    },
    child: Column(
      children: [
        Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(skate.urls[0]))),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              Text(
                '${skate.brand} ${skate.name}',
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getNote(skate.rate, Icons.star_rounded,
                      Icons.star_outline_rounded, 15),
                  Row(
                    children: [
                      Text(skate.price.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Icon(Icons.attach_money, size: 15)
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

