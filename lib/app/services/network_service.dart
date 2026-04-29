import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/home_model.dart';

class NetworkService {
  static const String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  static const String _apiKey = '18QBwoiRpbFgeYBSl3PxFHi2aoJjrt7lIindJfng';

  Future<HomeModel> fetchHomeData(String date) async {
    final uri = Uri.parse(
      _baseUrl,
    ).replace(queryParameters: {'api_key': _apiKey, 'date': date});

    debugPrint('GET → $uri');

    final response = await http.get(uri);

    debugPrint('Status: ${response.statusCode}');

    if (response.statusCode == 200) {
      debugPrint('Success — parsing response');
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return HomeModel.fromJson(json);
    } else {
      debugPrint('Error body: ${response.body}');
      final error = jsonDecode(response.body);
      throw Exception(
        error['msg'] ?? 'Failed to load data. Status: ${response.statusCode}',
      );
    }
  }
}
