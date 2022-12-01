import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  late GoogleMapController mapController;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<String, Marker> _markers = {};
  Map<String, Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: LatLng(43.610769, 3.876716), zoom: 14),
        onMapCreated: ((controller) {
          mapController = controller;
          addMarkers();
          //addPolylines();
          _getPolyline();
        }),
        markers: _markers.values.toSet(),
        polylines: _polylines.values.toSet(),
      ),
    );
  }

  addMarkers() {
    _markers["marcheDuLez"] = (const Marker(
        markerId: MarkerId("marcheDuLez"),
        position: LatLng(43.592886861946546, 3.9055549122740523),
        infoWindow: InfoWindow(title: "Marché du Lez", snippet: "C'est bon")));
    _markers["peyrou"] = (const Marker(
        markerId: MarkerId("peyrou"),
        position: LatLng(43.61133880197438, 3.8707500617576316),
        infoWindow: InfoWindow(title: "Peyrou", snippet: "Un grand espace")));
    _markers["esplanade"] = (const Marker(
        markerId: MarkerId("esplanade"),
        position: LatLng(43.61089552994617, 3.881532498367065),
        infoWindow: InfoWindow(
            title: "L'Esplanade", snippet: "Une belle ligne droite")));

    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAVLVVzcJ7hUVj5HsmibmoRhNHAdnVQXaA",
      PointLatLng(43.592886861946546, 3.9055549122740523),
      PointLatLng(43.61089552994617, 3.881532498367065),
      travelMode: TravelMode.driving,
      //wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: const Color(0xffFF914D),
        points: polylineCoordinates,
        width: 3);
    _polylines[id.value] = polyline;
    setState(() {});
  }
}
