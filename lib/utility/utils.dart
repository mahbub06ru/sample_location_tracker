import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  static showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static List<T> modelBuilder<M, T>(
      List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static String  arrayToString(items) {
    // List cities = ['NY', 'LA', 'Tokyo'];
   // List cities = items;
    String  s = items.join(',');

    return s;
  }

  static int  arrayToInt(items) {
    // List cities = ['NY', 'LA', 'Tokyo'];
    // List cities = items;
    int  s = items.join(',');
    // int value = int.parse(s) ;
    var inVal = s+1;
    return s;
  }
  static curleyBracesvalueIntoString(items) {
    // String curlyBraces = '{John, Alice, Bob}';

    var commaSeparatedValues = items
        .substring(1, items.length - 1) // Remove the curly braces
        .split(', ') // Split the values by comma and space
        .join(','); // Join the values with a comma

    return (commaSeparatedValues); // Output: John, Alice, Bob
  }

  static Map<int, String>  stringToArray(String item) {
    final tagName = item;
    final split = tagName.split(',');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    return values;
  }

}