import 'package:flutter/material.dart';


import '../../style/app_colors.dart';
import '../../style/text_styles.dart';

import 'header_text.dart';

class CustomFormFieldAddress extends StatelessWidget {
  bool? enableInteractiveSelection = true;
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final int maxLines;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;
  TextAlign? textAlign;

  CustomFormFieldAddress(
      {Key? key,
      this.enableInteractiveSelection,
      this.enabled,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
        this.prefixIcon,
      this.suffixIcon,
      required this.textInputType,
      this.textInputAction,
      required this.controller,
      required this.maxLines,
      this.validator,
      this.onChanged,
        this.textAlign
      }
  )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 5,
            top: 5,
            right: 10,
            bottom: 5,
          ),
          child: HeaderText(text: headingText, textAlign: null, textSize: 16,
            fontWeight: FontWeight.normal,

          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          decoration: BoxDecoration(
            // color: AppColors.grayshade,
            borderRadius: BorderRadius.circular(10),
            //   border: Border.all(
            //     color: Colors.grey,
            //   ),
            //   borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: TextFormField(
              textAlign: TextAlign.start,
              onChanged: onChanged,
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              cursorColor: Color(0xFFADADB1),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hintText,
                hintStyle: KTextStyle.textFieldHintStyle,
                // fillColor: Color(0xFFF1F1F1),
                // border: InputBorder.none,
                // suffixIcon: suffixIcon
                prefixIcon: prefixIcon,
              ),
              validator: validator,
            ),
          ),
        )
      ],
    );
  }
}
