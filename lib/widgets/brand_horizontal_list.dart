import 'package:e_skate/objects/skate.dart';
import 'package:e_skate/repository/data_repository.dart';
import 'package:e_skate/widgets/skatelist.dart';
import 'package:flutter/material.dart';
import 'package:e_skate/sharded/global.dart' as globals;

class BrandHorizontalList extends StatelessWidget {
  const BrandHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    List brand = listBrandIcon(context);
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

  Widget brandIcon(BuildContext context, String brand) {
    return GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
          width: 70,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              color: globals.globalColor,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              brand,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ),
        onTap: () {
          DataRepository repository = DataRepository();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Scaffold(
                      appBar: AppBar(title: Text(brand)),
                      body: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SkateList(
                            skates: repository.skates
                                .where('brand', isEqualTo: brand)
                                .snapshots()),
                      )))));
        });
  }

  List<Widget> listBrandIcon(BuildContext context) {
    List<Widget> list = [];
    for (var brand in BrandList_Mock) {
      list.add(brandIcon(context, brand));
    }
    return list;
  }
}
