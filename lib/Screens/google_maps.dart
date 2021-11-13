import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(12.9610, 77.6387), zoom: 15);
  late GoogleMapController _googleMapController;
  Set<Marker> markers = Set();

  Set<Marker> addMarker() {
    setState(() {
      markers.add(
        const Marker(
          markerId: MarkerId('Marker 1'),
          position: LatLng(12.962938, 77.632852),
          infoWindow:
              InfoWindow(title: 'Marker 1', snippet: 'This is marker 1'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
      markers.add(
        const Marker(
            markerId: MarkerId('Marker 2'),
            position: LatLng(12.968165, 77.631801),
            infoWindow:
                InfoWindow(title: 'Marker 2', snippet: 'This is marker 2'),
            icon: BitmapDescriptor.defaultMarker),
      );
      markers.add(
        const Marker(
            markerId: MarkerId('Marker 3'),
            position: LatLng(12.964897, 77.633897),
            infoWindow:
                InfoWindow(title: 'Marker 3', snippet: 'This is marker 3'),
            icon: BitmapDescriptor.defaultMarker),
      );
      markers.add(
        const Marker(
            markerId: MarkerId('Marker 4'),
            position: LatLng(12.966897, 77.633897),
            infoWindow:
                InfoWindow(title: 'Marker 4', snippet: 'This is marker 4'),
            icon: BitmapDescriptor.defaultMarker),
      );
      markers.add(
        Marker(
            markerId: const MarkerId('Home'),
            position: const LatLng(12.9610, 77.6387),
            infoWindow: const InfoWindow(
                title: 'Domlur', snippet: 'This is map center'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet)),
      );
    });
    return markers;
  }

  @override
  void dispose() {
    super.dispose();
    _googleMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
        zoomGesturesEnabled: true,
        markers: addMarker(),
        scrollGesturesEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (controller) {
          _googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.location_on_outlined,
          size: 30,
        ),
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
      ),
    );
  }
}
