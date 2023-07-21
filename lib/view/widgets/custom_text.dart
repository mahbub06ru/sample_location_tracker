import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String titleText;
  final String requiredText;
  final double sizeTitle;
  final double sizeReqText;
  final Color? color;
  final String? fontFamily;

  CustomText(this.titleText, this.requiredText, this.sizeTitle,
      this.sizeReqText, this.color, this.fontFamily);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleText,
              style: TextStyle(
                  fontSize: sizeTitle, color: color!, fontFamily: fontFamily),
            ),
            Text(
              requiredText,
              style: TextStyle(
                  fontSize: sizeReqText, color: color!, fontFamily: fontFamily),
            ),
          ],
        ));
  }
}