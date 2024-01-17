import 'package:cocoforms/enums/models.dart';
import 'package:cocoforms/interfaces/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:cocoforms/variables.dart' as vars;
import 'dart:convert';
import 'dart:developer';

class RemoteDataProvider extends DataProvider {
  void logIfDevelopment(String message) {
    if (kDebugMode) {
      log(message);
    }
  }

  @override
  Future<List<dynamic>> getAll(Models model) async {
    var url = Uri.parse('${vars.baseUrl}${model.name}');
    logIfDevelopment('Getting ${model.name}: ${url.toString()}');
    try {
      var response = await http.get(url);
      return jsonDecode(response.body);
    } catch (e) {
      log('HTTP ERROR: ${e.toString()}');
      log('${model.name} ${url.toString()}');
      return [];
    }
  }

  @override
  Future<dynamic> get(Models model, int id, {bool isDetailed = false}) async {
    var detailed = isDetailed ? "/detailed" : "";
    var url = Uri.parse('${vars.baseUrl}${model.name}/$id$detailed');
    logIfDevelopment('Getting ${model.name}: ${url.toString()}');
    try {
      var response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      log('HTTP ERROR: ${e.toString()}');
      return <String, dynamic>{};
    }
  }

  @override
  Future<List<dynamic>> getMany(Models model, int id,
      {bool isDetailed = false}) async {
    var detailed = isDetailed ? "/detailed" : "";
    var url = Uri.parse('${vars.baseUrl}${model.name}/$id$detailed');
    logIfDevelopment('Getting ${model.name}: ${url.toString()}');
    try {
      var response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      log('HTTP ERROR: ${e.toString()}');
      return <dynamic>[];
    }
  }
}
