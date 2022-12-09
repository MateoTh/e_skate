import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _currentForm = 0;

  static final List<Widget> _displayForm = <Widget>[
    vehiculeForm(),
    budjetForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return _displayForm.elementAt(_currentForm);
  }
}

void nextForm() {
  //_currentForm += 1;
}

Widget vehiculeForm() {
  return ListView(
    children: [
      ListTile(
        title: const Text("Skateboards"),
        leading: const Icon(Icons.skateboarding),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("OneWeels"),
        leading: const Icon(Icons.circle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("Unicyles"),
        leading: const Icon(Icons.circle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("Scooters"),
        leading: const Icon(Icons.electric_scooter),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("Bikes"),
        leading: const Icon(Icons.electric_bike),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
    ],
  );
}

Widget budjetForm() {
  return ListView(
    children: [
      ListTile(
        title: const Text("- 300 €"),
        leading: const Icon(Icons.star_border),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("300 / 600 €"),
        leading: const Icon(Icons.star),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("600 / 900 €"),
        leading: const Icon(Icons.sunny_snowing),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      ),
      ListTile(
        title: const Text("+ 900 €"),
        leading: const Icon(Icons.sunny),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => {nextForm()},
      )
    ],
  );
}
