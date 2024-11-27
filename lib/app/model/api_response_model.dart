class ApiResponseModel {
  final bool success;
  final String message;
  final int status;
  final Map<String, dynamic> data;

  ApiResponseModel.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        status = json['status'],
        data = json['data'];
}
