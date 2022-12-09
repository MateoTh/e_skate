import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        FilterListTile('Skateboards', const Icon(Icons.skateboarding)),
        FilterListTile('OneWeels', const Icon(Icons.circle)),
        FilterListTile('Unicyles', const Icon(Icons.circle)),
        FilterListTile('Scooters', const Icon(Icons.electric_scooter)),
        FilterListTile('Bikes', const Icon(Icons.electric_bike)),
      ],
    );
  }

  Widget budjetForm() {
    return ListView(
      children: [
        FilterListTile('000 / 300 €', const Icon(Icons.star_border)),
        FilterListTile('300 / 600 €', const Icon(Icons.star)),
        FilterListTile('600 / 900 €', const Icon(Icons.sunny_snowing)),
        FilterListTile('900 / +++ €', const Icon(Icons.sunny)),
      ],
    );
  }

  Widget FilterListTile(String text, Icon icon) {
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
