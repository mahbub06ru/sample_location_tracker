import 'package:flutter/material.dart';
class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Loading'),
      content: CircularProgressIndicator(),
    );
  }
}