import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/objects/video.dart';
import 'package:e_skate/widgets/widgets.dart';
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
        appBar:
            AppBar(title: Text('${widget.skate.brand} ${widget.skate.name}')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagesCarousel(widget.skate.urls, 300),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
              child: const Text(
                'Specifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                  child: const Text('Check website'),
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
                  child: const Text('Check website'),
                )
              ],
            ),
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
