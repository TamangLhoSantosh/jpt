import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(27.686382, 85.315399),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

@override
void initState() {
    // TODO: implement initState
    super.initState();
    _loadMapStyle();
    loadmapdelay();

    //delay

  }
  bool showmap = false;
  loadmapdelay(){
    Future.delayed(Duration(seconds: 1)).whenComplete((){
      setState(() {
        showmap = true;
      });
    });
  }
  var maptheme;
Future _loadMapStyle() async {
  maptheme = await rootBundle.loadString('assest/raw/maptheme.json');
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          showmap?GoogleMap(
            //mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            markers: {
              const Marker(
                markerId: MarkerId("Help"),
                position: LatLng(27.686623, 85.317098),
              )
            },
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(maptheme);
              _controller.complete(controller);
            },
          ):Container(
            child: Center(child: CircularProgressIndicator(),),
          ),

          Positioned(
            top: 15,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}