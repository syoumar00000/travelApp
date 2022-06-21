import 'dart:convert';
import 'package:agnonter/models/data_model.dart';
import 'package:flutter/services.dart';

class DataServices {
  Future<List<DataModel>> getInfo() async {
    final response = await rootBundle.loadString("asset/utils/fcil.json");
    try {
      if (response.isNotEmpty) {
        List<dynamic> list = json.decode(response);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      return <DataModel>[];
    }
  }
}
