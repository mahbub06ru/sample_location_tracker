import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hbm/style/app_colors.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';

class HomeController extends GetxController {
  final storage = GetStorage();

  LocationData? _currentLocation;

  LocationData? get currentLocation => _currentLocation;

  showSussesDialog(title,body){
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        body,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: const Text(
                                'Back',
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                primary: AppColors.appColor,
                                onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.back();

                              },
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    _initCurrentLocation();
    super.onInit();
  }

  Future<void> _initCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await location.getLocation();
    update(); // Notify the listeners that the location has changed
  }
  Future<void> sendLocationInfo() async {
    if (_currentLocation == null) {
      return;
    }
    Map<String, dynamic> payload = {
      'latitude': _currentLocation!.latitude.toString(),
      'longitude': _currentLocation!.longitude.toString(),
    };

    String apiUrl = 'http://freshexport.com.au/api/';

    print(_currentLocation!.latitude);
    print(_currentLocation!.longitude);
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: payload,
      );

      if (response.statusCode == 200) {
        print('Location sent successfully.');
        showSussesDialog('Good job!', 'Location info sent successfully.');
      } else {
        print('Error sending location. Status code: ${response.statusCode}');
        showSussesDialog('Oops', 'Something went wrong.');
      }
    } catch (e) {
      print('Error sending location: $e');
      showSussesDialog('Oops', 'Error sending location: $e');
    }
  }
}
