import 'package:flutter/material.dart';
import 'package:hbm/style/app_colors.dart';

class RoundedCustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Function onPressed;
  final Color? color;

  const RoundedCustomButton({
    Key? key,
    required this.text,
     this.height,
     this.width,
    required this.onPressed,
    this.color = AppColors.appColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        child: Text(
          text,
          style: TextStyle(fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
