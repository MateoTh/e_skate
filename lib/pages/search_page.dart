import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentForm = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> forms = getForms();
    return forms.elementAt(currentForm);
  }

  List<Widget> getForms() {
    return [
      vehiculeForm(),
      budjetForm(),
    ];
  }

  void nextForm() {
    if (currentForm + 1 < getForms().length) currentForm += 1;
    setState(() {});
  }

  Widget vehiculeForm() {
    return ListView(
      children: [
        filterListTile('Skateboards', const Icon(Icons.skateboarding)),
        filterListTile('OneWeels', const Icon(Icons.circle)),
        filterListTile('Unicyles', const Icon(Icons.circle)),
        filterListTile('Scooters', const Icon(Icons.electric_scooter)),
        filterListTile('Bikes', const Icon(Icons.electric_bike)),
      ],
    );
  }

  Widget budjetForm() {
    return ListView(
      children: [
        filterListTile('000 / 300 €', const Icon(Icons.star_border)),
        filterListTile('300 / 600 €', const Icon(Icons.star)),
        filterListTile('600 / 900 €', const Icon(Icons.sunny_snowing)),
        filterListTile('900 / +++ €', const Icon(Icons.sunny)),
      ],
    );
  }

  Widget filterListTile(String text, Icon icon) {
    return ListTile(
      title: Text(text),
      leading: icon,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => {nextForm()},
    );
  }
}
