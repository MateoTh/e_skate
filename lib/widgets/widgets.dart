import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget getNote(
    double note, IconData iconFilled, IconData iconEmpty, double size) {
  int intNote = note.round();
  List<Icon> liste = [];

  for (var i = 0; i < intNote; i++) {
    liste.add(Icon(iconFilled, size: size, color: const Color(0xffFF914D)));
  }

  for (var i = 0; i < 5 - intNote; i++) {
    liste.add(Icon(iconEmpty, size: size, color: const Color(0xffFF914D)));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: liste,
  );
}

Widget listTileYoutube(String idVideo, String name, String author) {
  return ListTile(
    leading: Image.network('https://img.youtube.com/vi/$idVideo/0.jpg'),
    title: Text(name),
    subtitle: Text('@$author'),
    trailing: const Icon(Icons.play_arrow),
    onTap: () async {
      if (!await launchUrl(
        Uri.http('www.youtube.com', 'watch', {'v': '$idVideo'}),
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch www.youtube.com/watch?v=$idVideo';
      }
    },
  );
}

Widget imagesCarousel(List<String> images, double height) {
  return CarouselSlider(
    options: CarouselOptions(
      height: height,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
    ),
    items: images
        .map((item) => Container(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList(),
  );
}
