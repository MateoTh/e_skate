import 'package:e_skate/objects/formData.dart';
import 'package:e_skate/repository/data_repository.dart';
import 'package:e_skate/widgets/skatelist.dart';
import 'package:flutter/material.dart';

class FromResult extends StatefulWidget {
  const FromResult({super.key, required this.formData});
  final FormData formData;

  @override
  State<FromResult> createState() => _FromResultState();
}

class _FromResultState extends State<FromResult> {
  DataRepository repository = DataRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.formData.budjetLibelle!} budjet'),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 10),
          child: SkateList(
              skates: repository.skates
                  .where('type', isEqualTo: widget.formData.vehiculeValue)
                  .where('price',
                      isGreaterThanOrEqualTo: widget.formData.budjetMin)
                  .where('price',
                      isLessThanOrEqualTo: widget.formData.budjetMax)
                  .snapshots())),
    );
  }
}
