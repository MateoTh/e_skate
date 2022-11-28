import 'package:flutter/cupertino.dart';

Widget GetNote(
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
