import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbm/style/app_colors.dart';

import 'package:get/get.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:get_storage/get_storage.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../../../style/app_colors.dart';
import '../home/home_screen.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {

  final storage = GetStorage();
  var _visible = true;
  bool?   loading ;
  String? UserID,todaysDate;
  AnimationController? animationController;
  Animation<double>? animation;

  bool? _isConnected;
  // This function is triggered when the floating button is pressed
  Future<void> _checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');//kindacode
        print(response);
      if (response.isNotEmpty) {
        setState(() {
          _isConnected = true;
          startTime();
        });
      }
    } on SocketException catch (err) {
      setState(() {
        _isConnected = false;
      });
      if (kDebugMode) {
        print(err);
      }
    }
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(value,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 16.0, fontWeight:
          FontWeight.bold),), duration: const Duration(seconds: 2), backgroundColor: Colors.blueAccent,)
    );
    // Get.back();
    // Navigator.pop(context);

  }

  void _showAlertDialogue(BuildContext context) {
    // set up the buttons
    Widget selfie = TextButton(
      child: const Text("Enable"),
      onPressed:  () {
          /*  AppSettings.openDeviceSettings(
          asAnotherTask: true,
        );*/
      },
    );
    Widget gallery = TextButton(
        child: const Text("OK"),
        onPressed:   (){
          Navigator.pop(context);
          SystemNavigator.pop();
        }
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("No Internet!"),
      content: const Text("Please enable your internet connection!"),
      actions: [
        // selfie,
        gallery,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void navigationPage() {
    // detectUser();
    if(_isConnected == true){

        Get.back();
        Get.to(() =>  const HomePage(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 500));

    }else{
      showInSnackBar("Please enable your internet connection!");
      _showAlertDialogue(context);

    }

  }

  @override
  void initState() {
    super.initState();

    _checkInternetConnection();
    setState(() {
      _visible = !_visible;
    });


  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(),
      ),
    );
  }
}
