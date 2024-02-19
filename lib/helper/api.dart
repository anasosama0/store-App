import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return _handleResponse(response);
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    return _handleResponse(response);
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    print('url = $url body = $body token = $token');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    print('Response Body: ${response.body}');

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Check if the Content-Type is JSON
      if (response.headers['content-type']?.contains('application/json') == true) {
        return jsonDecode(response.body);
      } else {
        print('Received non-JSON response. Body: ${response.body}');
        // Handle non-JSON response (You might want to display an error to the user or handle it accordingly)
        return null; // or throw an exception
      }
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} and body ${response.body}');
    }
  }
}
