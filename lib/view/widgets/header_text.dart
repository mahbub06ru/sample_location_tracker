import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;
  final String? fontFamily;
  final bool? softWrap=false;
  final FontWeight fontWeight;



  HeaderText({required this.text, required this.textSize, this.color,
       required this.textAlign, this.fontFamily, this.overflow, this.maxLine, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        textAlign: textAlign,
        softWrap: softWrap,
        style: new TextStyle(
        fontSize:textSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
    ));
  }
}