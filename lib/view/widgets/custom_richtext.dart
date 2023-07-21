import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../style/app_colors.dart';


class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
      required this.discription,
      required this.text,
      required this.onTap})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 10,
          top: 20),
      child: Text.rich(
        TextSpan(
            text: discription,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            children: [
              TextSpan(
                  text: text,
                  style: const TextStyle(color:   AppColors.blue, fontSize: 16),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ]),
      ),
    );
  }
}
