import 'package:e_skate/objects/skate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BrandHorizontalList extends StatelessWidget {
  const BrandHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    List brand = listBrandIcon();
    return Container(
        margin: const EdgeInsets.only(top: 15, left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Popular brands',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brand.length,
              itemBuilder: (context, index) {
                return brand[index];
              },
            ),
          )
        ]));
  }

  Widget brandIcon(String brand) {
    return GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
          width: 70,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              color: const Color(0xffFF914D),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              brand,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
        onTap: () {});
  }

  List<Widget> listBrandIcon() {
    List<Widget> list = [];
    for (var brand in BrandList_Mock) {
      list.add(brandIcon(brand));
    }
    return list;
  }
}
