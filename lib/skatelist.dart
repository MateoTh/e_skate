import 'package:e_skate/details.dart';
import 'package:e_skate/widgets.dart';
import 'package:flutter/material.dart';

import 'objects/skate.dart';

class SkateList extends StatefulWidget {
  const SkateList({super.key});

  @override
  State<SkateList> createState() => _SkateListState();
}

class _SkateListState extends State<SkateList> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 20,
        children: listCardSkate(context));
    ;
  }
}

List<Widget> listCardSkate(BuildContext context) {
  List<Widget> cards = [];
  for (var skate in SkateList_Mock) {
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
        Text('${skate.brand} ${skate.name}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 3),
        Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(skate.url))),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            getNote(
                skate.rate, Icons.star_rounded, Icons.star_outline_rounded, 15),
            Row(
              children: [
                Text(skate.price.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Icon(Icons.attach_money, size: 15)
              ],
            )
          ],
        )
      ],
    ),
  );
}
