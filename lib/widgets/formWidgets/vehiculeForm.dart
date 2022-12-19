import 'package:e_skate/objects/formData.dart';
import 'package:e_skate/widgets/formWidgets/budjetForm.dart';
import 'package:flutter/material.dart';

class VehiculeForm extends StatefulWidget {
  const VehiculeForm({super.key});

  @override
  State<VehiculeForm> createState() => _VehiculeFormState();
}

class _VehiculeFormState extends State<VehiculeForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      filterListTile(context, 'Skateboards', 'skateboard',
          const Icon(Icons.skateboarding)),
      filterListTile(
          context, 'Scooters', 'scooter', const Icon(Icons.electric_scooter)),
      filterListTile(context, 'Bikes', 'bike', const Icon(Icons.electric_bike)),
    ]);
  }

  Widget filterListTile(
      BuildContext context, String text, String value, Icon icon) {
    FormData formData = FormData();
    formData.vehiculeLibelle = text;
    formData.vehiculeValue = value;
    return ListTile(
      title: Text(text),
      leading: icon,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BudjetForm(formData: formData)))
      },
    );
  }
}
