import 'package:cloud_firestore/cloud_firestore.dart';

class Skate {
  String uid;
  List<String> urls;
  String name = 'Name';
  String brand = 'Brand';
  String webSite = '';
  num topSpeed = 1;
  num range = 1;
  num price = 600;
  num? rate = 3.5;
  String? referenceId;
  List<String> likes;
  List<String> owners;

  Skate(this.uid, this.urls, this.name, this.brand, this.webSite, this.topSpeed,
      this.range, this.price, this.rate, this.likes, this.owners);

  factory Skate.fromJson(Map<String, dynamic> json, String id) =>
      skateFromJson(json, id);
  factory Skate.fromSnapshot(DocumentSnapshot snapshot) {
    return Skate.fromJson(snapshot.data() as Map<String, dynamic>, snapshot.id);
  }
}

Skate skateFromJson(Map<String, dynamic> json, String id) {
  return Skate(
      id,
      List<String>.from(json["images"].map((x) => x)),
      json['name'] as String,
      json['brand'] as String,
      json['webSite'] as String,
      json['topSpeed'] as num,
      json['range'] as num,
      json['price'] as num,
      json['rate'] as num,
      json['likes'].map<String>((i) => i as String).toList(),
      json['owners'].map<String>((i) => i as String).toList());
}

// 2
Map<String, dynamic> skateToJson(Skate instance) => <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'webSite': instance.webSite,
      'topSpeed': instance.topSpeed,
      'images': instance.urls,
      'range': instance.range,
      'price': instance.price,
      'rate': instance.rate,
      'likes': instance.likes,
    };

List<String> BrandList_Mock = [
  'Backfire',
  'Ownboard',
  'Teamgee',
  'WowGo',
  'Elwing'
];
