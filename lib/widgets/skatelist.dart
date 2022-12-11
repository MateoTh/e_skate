import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_skate/details.dart';
import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/repository/data_repository.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SkateList extends StatefulWidget {
  const SkateList({super.key});

  @override
  State<SkateList> createState() => _SkateListState();
}

class _SkateListState extends State<SkateList> {
  @override
  Widget build(BuildContext context) {
    final DataRepository repository = DataRepository();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
          child: const Text(
            'Discover',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: repository.skates.orderBy('name').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LinearProgressIndicator(
                color: Color(0xffFF914D),
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
        ),
      ],
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
            return Details(skate: skate);
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 3),
              Text(
                '${skate.brand} ${skate.name}',
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                getNote(skate.rate, Icons.star_rounded,
                    Icons.star_outline_rounded, 15),
                Row(children: [
                  Text(skate.price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Icon(Icons.attach_money, size: 15)
                ])
              ])
            ]))
      ],
    ),
  );
}
