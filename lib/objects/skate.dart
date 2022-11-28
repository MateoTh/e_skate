class Skate {
  List<String> urls;
  String name = 'Name';
  String brand = 'Brand';
  int topSpeed = 1;
  int range = 1;
  int price = 600;
  double rate = 3.5;

  Skate(this.urls, this.name, this.brand, this.topSpeed, this.range, this.price,
      this.rate);
  Skate.url(this.urls);
}

List<Skate> SkateList_Mock = [
  Skate([
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-zealot-1_510x@2x.progressive.jpg?v=1629871979',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-zealot-7_510x@2x.progressive.jpg?v=1629871979',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-zealot-6_510x@2x.progressive.jpg?v=1629871979'
  ], 'Zealot', 'Backfire', 46, 30, 699, 4.86),
  Skate([
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-g3-31_510x@2x.progressive.jpg?v=1629295255',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-g3-33_510x@2x.progressive.jpg?v=1629295255',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-g3-36_510x@2x.progressive.jpg?v=1629295255'
  ], 'G3', 'Backfire', 46, 30, 649, 3.5),
  Skate([
    'https://cdn.shopify.com/s/files/1/3006/5642/products/hammer-s-5_510x@2x.progressive.jpg?v=1653015484',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/hammer-s-1_510x@2x.progressive.jpg?v=1663685051',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/hammer-s-6_510x@2x.progressive.jpg?v=1663685051'
  ], 'Hammer Sledge', 'Backfire', 46, 30, 1699, 4.56),
  Skate([
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-era-1_510x@2x.progressive.jpg?v=1651028866',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-era-6_510x@2x.progressive.jpg?v=1651028866',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/backfire-era-2_510x@2x.progressive.jpg?v=1651028866'
  ], 'ERA', 'Backfire', 46, 30, 399, 2.2),
  Skate([
    'https://cdn.shopify.com/s/files/1/3006/5642/products/era-2-zen_510x@2x.progressive.jpg?v=1667035389',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/MG_7832_510x@2x.progressive.jpg?v=1667039859,',
    'https://cdn.shopify.com/s/files/1/3006/5642/products/4564654_510x@2x.progressive.jpg?v=1667039859'
  ], 'ERA 2', 'Backfire', 46, 30, 399, 4.2),
  Skate([
    'https://cdn.shopify.com/s/files/1/0015/7374/8789/products/teamgee-h20t_720x.jpg?v=1667984441',
    'https://cdn.shopify.com/s/files/1/0015/7374/8789/products/TeamgeeH20TElectricSkateboardWithRubberWheelsProductImage_4_720x.png?v=1667984441',
    'https://cdn.shopify.com/s/files/1/0015/7374/8789/products/TeamgeeH20TElectricSkateboardWithRubberWheelsProductImage_9_720x.png?v=1667984441'
  ], 'H20T', 'TeamGee', 46, 30, 799, 4.9),
  Skate([
    'https://cdn.shopify.com/s/files/1/0015/7374/8789/products/1_720x.jpg?v=1667984602',
    'https://cdn.shopify.com/s/files/1/0015/7374/8789/products/TeamgeeH20ElectricSkateboardLongboard_BestChoiceforCommuteProductImage_8_720x.png?v=1667984602'
  ], 'H20', 'TeamGee', 699, 30, 399, 4.4),
];
