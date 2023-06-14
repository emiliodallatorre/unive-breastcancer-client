import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unive_breastcancer_client/models/predict_request_model.dart';
import 'package:unive_breastcancer_client/models/predict_response_model.dart';
import 'package:unive_breastcancer_client/references.dart';

class PredictionProvider {
  static Future<PredictResponseModel> predict(final PredictRequestModel request) async {
    const String route = "/predict";

    final Uri uri = Uri.parse(composeUrl(route));
    final Map<String, String> headers = <String, String>{
      "Content-Type": "application/json",
      "accept": "application/json",
    };
    final String body = jsonEncode(request.toJson());
    debugPrint("Request: $body");
    debugPrint("URL: $uri");

    final http.Response response = await http.post(uri, headers: headers, body: body);
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return PredictResponseModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.toString());
      throw Exception("Failed to predict");
    }
  }

  static String composeUrl(final String route) => "${References.baseUrl}$route";
}
