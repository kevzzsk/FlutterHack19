import 'package:flutterhack19/json_load.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class JSONload {
  static Future loadData(widget) async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonResponse = json.decode(jsonString);
    return jsonResponse;
  }
}
