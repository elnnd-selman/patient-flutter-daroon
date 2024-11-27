import 'dart:convert';

import 'package:daroon_user/app/model/api_response_model.dart';

extension JsonExtension on String {
  String extractErrorMessage() {
    try {
      final response = ApiResponseModel.fromJson(jsonDecode(this));
      return response.message;
    } catch (e) {
      // Handle errors, such as invalid JSON format
      return 'An error occurred while parsing the response.';
    }
  }
}
