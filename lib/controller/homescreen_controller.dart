// import 'dart:html';

import 'dart:convert';

import 'package:api_sample4/model/sample_api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreencontroller with ChangeNotifier {
  SampleApiResmodel? resModel;
  fetchData() async {
    final url = Uri.parse("http://3.93.46.140/employees/");
    var response = await http.get(url);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      resModel = SampleApiResmodel.fromJson(decodeData);
      print(resModel?.data?.first.name);
      notifyListeners();
    } else {
      print("api call failed");
    }
  }

// to delete
  deleteData(int id) async {
    final url = Uri.parse("http://3.93.46.140/employees/$id/");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      resModel = SampleApiResmodel.fromJson(decodeData);
      // print(resModel?.data?.first.name);
      notifyListeners();
    } else {
      print("api call failed");
    }
  }

  updateData(int id) async {
    final url = Uri.parse("http://3.93.46.140/employees/$id/");
    var response = await http.post(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      resModel = SampleApiResmodel.fromJson(decodeData);
      // print(resModel?.data?.first.name);
      notifyListeners();
    } else {
      print("api call failed");
    }
  }
}
