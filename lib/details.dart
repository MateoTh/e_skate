import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/objects/video.dart';
import 'package:e_skate/widgets/widgets.dart';
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
            imagesCarousel(widget.skate.urls, 300),
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
            Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: VideoList_Mock.length,
                  itemBuilder: ((context, index) {
                    return listTileYoutube(
                        VideoList_Mock[index].urlId,
                        VideoList_Mock[index].name,
                        VideoList_Mock[index].author);
                  }),
                  padding: const EdgeInsets.all(8)),
            )
          ],
        ));
  }
}
