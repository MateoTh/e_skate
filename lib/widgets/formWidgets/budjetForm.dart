import 'package:e_skate/objects/formData.dart';
import 'package:e_skate/widgets/formWidgets/formResult.dart';
import 'package:flutter/material.dart';

class BudjetForm extends StatefulWidget {
  const BudjetForm({super.key, required this.formData});
  final FormData formData;

  @override
  State<BudjetForm> createState() => _BudjetFormState();
}

class _BudjetFormState extends State<BudjetForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.formData.vehiculeLibelle!)),
      body: ListView(
        children: [
          filterListTile(
              '000 / 300 €', 0, 300, 'entry', const Icon(Icons.star_border)),
          filterListTile(
              '300 / 600 €', 300, 600, 'low', const Icon(Icons.star)),
          filterListTile('600 / 900 €', 600, 900, 'medium',
              const Icon(Icons.sunny_snowing)),
          filterListTile(
              '900 / +++ €', 900, 9999, 'high', const Icon(Icons.sunny)),
        ],
      ),
    );
  }

  Widget filterListTile(
      String text, num min, num max, String value, Icon icon) {
    return ListTile(
      title: Text(text),
      leading: icon,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => {
        widget.formData.budjetLibelle = value,
        widget.formData.budjetMin = min,
        widget.formData.budjetMax = max,
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FromResult(
                      formData: widget.formData,
                    )))
      },
    );
  }
}
