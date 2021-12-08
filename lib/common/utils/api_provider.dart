import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static const String _authority = 'pokeapi.co';
  static const String _path = '/api/v2/';
  late int _statusCode;

  int get statusCode => _statusCode;

  Future<Map<String, dynamic>?> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    Uri url = Uri.https(_authority, _path + endpoint, queryParams);

    http.Response response = await http.get(url);
    _statusCode = response.statusCode;

    if (_statusCode == 200) {
      debugPrint('Response Status code: $_statusCode');
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      debugPrint('Response Status code: $_statusCode');
    }
  }

  Future<Map<String, dynamic>?> getByUrl({
    required String urlString,
    Map<String, String>? queryParams,
  }) async {
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url, headers: queryParams);
    _statusCode = response.statusCode;

    if (_statusCode == 200) {
      debugPrint('Response Status code: ${_statusCode}');
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      debugPrint('Response Status code: ${_statusCode}');
    }
  }
}
