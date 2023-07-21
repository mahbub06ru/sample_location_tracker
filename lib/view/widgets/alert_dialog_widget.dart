import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {
  final String headerText;
  final String positiveText;
  final String negativeText;
  final String? middleText;
  final void Function()? posOnPressed;
  final void Function()? negOnPressed;
  final void Function()? middleOnPressed;
  final Widget widget;

  ShowAlertDialog({required this.headerText,required this.positiveText,required this.negativeText, this.middleText, required this.posOnPressed,required this.negOnPressed,
     this.middleOnPressed, required this.widget});

  _showAlertDialogue(BuildContext context) {
    // set up the buttons
    Widget cancel = TextButton(
      child: Text(negativeText),
      onPressed: negOnPressed,
    );
    Widget positive = TextButton(
        child: Text(positiveText),
        onPressed: posOnPressed
    );
    Widget middle = TextButton(
        child: Text(positiveText),
        onPressed: posOnPressed
    );

    ;
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(headerText),
      // content: Text("Please enable your internet connection!"),
      actions: [
        cancel,
        positive,
        // middle

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


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> _showAlertDialogue(context),
      child: Container(
        child: widget,

      ),
    );
  }
}
