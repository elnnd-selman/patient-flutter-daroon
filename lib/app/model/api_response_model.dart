class ApiResponseModel {
  final bool success;
  final String message;
  final int status;

  ApiResponseModel.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        status = json['status'];
}
