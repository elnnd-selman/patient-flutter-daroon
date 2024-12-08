class UserSpecificVoiceModel {
  UserSpecificVoiceModel({
    required this.success,
    required this.message,
    required this.status,
    required this.data,
  });

  final bool? success;
  final String? message;
  final int? status;
  final UserSpecificVoiceModelData? data;

  factory UserSpecificVoiceModel.fromJson(Map<String, dynamic> json) {
    return UserSpecificVoiceModel(
      success: json["success"],
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? null
          : UserSpecificVoiceModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "status": status,
        "data": data?.toJson(),
      };
}

class UserSpecificVoiceModelData {
  UserSpecificVoiceModelData({
    required this.succuess,
    required this.message,
    required this.data,
  });

  final bool? succuess;
  final String? message;
  final DataData? data;

  factory UserSpecificVoiceModelData.fromJson(Map<String, dynamic> json) {
    return UserSpecificVoiceModelData(
      succuess: json["succuess"],
      message: json["message"],
      data: json["data"] == null ? null : DataData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "succuess": succuess,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataData {
  DataData({
    required this.paymentId,
    required this.readableCode,
    required this.qrCode,
    required this.validUntil,
    required this.personalAppLink,
    required this.businessAppLink,
    required this.corporateAppLink,
  });

  final String? paymentId;
  final String? readableCode;
  final String? qrCode;
  final DateTime? validUntil;
  final String? personalAppLink;
  final String? businessAppLink;
  final String? corporateAppLink;

  factory DataData.fromJson(Map<String, dynamic> json) {
    return DataData(
      paymentId: json["paymentId"],
      readableCode: json["readableCode"],
      qrCode: json["qrCode"],
      validUntil: DateTime.tryParse(json["validUntil"] ?? ""),
      personalAppLink: json["personalAppLink"],
      businessAppLink: json["businessAppLink"],
      corporateAppLink: json["corporateAppLink"],
    );
  }

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "readableCode": readableCode,
        "qrCode": qrCode,
        "validUntil": validUntil?.toIso8601String(),
        "personalAppLink": personalAppLink,
        "businessAppLink": businessAppLink,
        "corporateAppLink": corporateAppLink,
      };
}
