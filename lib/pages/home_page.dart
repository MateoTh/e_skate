import 'package:e_skate/repository/data_repository.dart';
import 'package:e_skate/widgets/brand_horizontal_list.dart';
import 'package:e_skate/widgets/skatelist.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BrandHorizontalList(),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
          child: const Text(
            'Discover',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SkateList(
          skates: repository.skates.orderBy('name').snapshots(),
        ),
      ],
    );
  }
}
