import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:e_skate/sharded/global.dart' as globals;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};
  Map<String, Polyline> _polylines = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: LatLng(43.610769, 3.876716), zoom: 14),
        onMapCreated: ((controller) {
          mapController = controller;
          //addMarkers();
          //addPolylines();
          _getPolyline(const LatLng(43.60837552165201, 3.8968119408250335),
              const LatLng(43.527684981571575, 3.932344557581942), "plage");

          _getPolyline(const LatLng(43.63422142078255, 3.9189989554301183),
              const LatLng(43.60735420911202, 3.8685841120620483), "claire");
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

  _getPolyline(LatLng depart, LatLng arrivee, String id) async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
      "AIzaSyAVLVVzcJ7hUVj5HsmibmoRhNHAdnVQXaA",
      PointLatLng(depart.latitude, depart.longitude),
      PointLatLng(arrivee.latitude, arrivee.longitude),
      travelMode: TravelMode.bicycling,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    Polyline polyline = Polyline(
        polylineId: PolylineId(id),
        color: globals.globalColor,
        points: polylineCoordinates,
        width: 3);
    _polylines[id] = polyline;

    setState(() {});
  }
}
