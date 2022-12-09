import 'package:e_skate/widgets/brand_horizontal_list.dart';
import 'package:e_skate/widgets/skatelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BrandHorizontalList(),
        SkateList(),
      ],
    );
  }
}
