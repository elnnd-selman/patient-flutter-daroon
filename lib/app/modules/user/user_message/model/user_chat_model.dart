import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';

class UserChatModel {
  UserChatModel({
    required this.id,
    required this.conversation,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? conversation;
  final ErId? senderId;
  final ErId? receiverId;
  final String? text;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory UserChatModel.fromJson(Map<String, dynamic> json) {
    return UserChatModel(
      id: json["_id"],
      conversation: json["conversation"],
      senderId:
          json["senderId"] == null ? null : ErId.fromJson(json["senderId"]),
      receiverId:
          json["receiverId"] == null ? null : ErId.fromJson(json["receiverId"]),
      text: json["text"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "conversation": conversation,
        "senderId": senderId?.toJson(),
        "receiverId": receiverId?.toJson(),
        "text": text,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class ErId {
  ErId({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.gender,
    required this.lastNameKu,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.profilePicture,
    required this.isThirdParty,
    required this.usePictureAsLink,
    required this.dateOfBirth,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? username;
  final String? gender;
  final String? lastNameKu;
  final String? lastNameAr;
  final String? lastNameEn;
  ProfilePicture? profilePicture;
  final bool? isThirdParty;
  final bool? usePictureAsLink;
  final DateTime? dateOfBirth;

  factory ErId.fromJson(Map<String, dynamic> json) {
    return ErId(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      gender: json["gender"],
      lastNameKu: json["lastName_ku"],
      lastNameAr: json["lastName_ar"],
      lastNameEn: json["lastName_en"],
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"] == "image key (optional)"
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      isThirdParty: json["isThirdParty"],
      usePictureAsLink: json["usePictureAsLink"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "firstName_ku": firstNameKu,
        "firstName_en": firstNameEn,
        "firstName_ar": firstNameAr,
        "username": username,
        "gender": gender,
        "lastName_ku": lastNameKu,
        "lastName_ar": lastNameAr,
        "lastName_en": lastNameEn,
        "isThirdParty": isThirdParty,
        "usePictureAsLink": usePictureAsLink,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
      };
}
