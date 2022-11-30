import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: LatLng(43.610769, 3.876716), zoom: 14),
        onMapCreated: ((controller) {
          mapController = controller;
          addMarkers();
        }),
        markers: _markers.values.toSet(),
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
}
