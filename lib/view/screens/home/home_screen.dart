import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.put(HomeController());

  @override
  void initState() {


    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample location tracker'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _controller.sendLocationInfo();
                },
                child: Row(
                  children: [
                    Text('Send'),
                    Icon(
                      Icons.send_outlined,
                      size: 26.0,
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
      body: Center(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.currentLocation == null
                ? const CircularProgressIndicator()
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  controller.currentLocation!.latitude!,
                  controller.currentLocation!.longitude!,
                ),
                zoom: 18,
              ),
              onMapCreated: (controller) {},
              markers: {
                Marker(
                  markerId: const MarkerId('current_location'),
                  position: LatLng(
                    controller.currentLocation!.latitude!,
                    controller.currentLocation!.longitude!,
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                ),
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.sendLocationInfo();
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
