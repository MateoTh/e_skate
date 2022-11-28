import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/widgets.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details({super.key, required this.skate});
  Skate skate;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('${widget.skate.brand} ${widget.skate.name}')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(widget.skate.url))),
            GetNote(widget.skate.rate, Icons.star_rounded,
                Icons.star_outline_rounded, 50),
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
                Text('${widget.skate.price}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Icon(Icons.euro, size: 10)
              ])
            ])
          ],
        ));
  }
}
