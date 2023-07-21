import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hbm/view/widgets/header_text.dart';

import '../../utility/constants.dart';


class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  final storage = GetStorage();
  static const double fontSize = 20.0;

  var userName,userType, userId, token, Designation, Email, supervisor;

  @override
  void initState() {
    userName = storage.read('UserName');
    // userType = storage.read('userType');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child:  Column(
          children: [
            Expanded(
              child: ListView(
                children: [

                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))
              ),
              color: Colors.red,
              child: ListTile(
                title: HeaderText(
                  maxLine: 2,
                  text: Constants.logout,
                  textSize: 16,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.normal,
                ),
                leading: IconButton(
                  icon: Icon(Icons.login_outlined,size: 30,  color: Colors.white),
                  onPressed: () {  },
                ),
                onTap: () {

                },
              ),
            ),
          ],

        )
        ),
    );
  }
}
