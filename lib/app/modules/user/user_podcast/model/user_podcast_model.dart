import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/model/profile_picture_model.dart';
import 'package:daroon_user/app/model/specialty_model.dart';

import '../../../../model/education_model.dart';

class PodCastModel {
  PodCastModel({
    required this.id,
    required this.user,
    required this.titleKu,
    required this.titleEn,
    required this.titleAr,
    required this.contentKu,
    required this.contentAr,
    required this.contentEn,
    required this.images,
    required this.videos,
    required this.contentType,
    required this.isLiked,
    required this.createdAt,
    required this.v,
    required this.commentCount,
    required this.likes,
    required this.type,
  });

  final String? id;
  final User? user;
  final String? titleKu;
  final String? titleEn;
  final String? titleAr;
  final String? contentKu;
  final String? contentAr;
  final String? contentEn;
  final List<String> images;
  final List<String> videos;
  final String? contentType;
  bool? isLiked;
  final DateTime? createdAt;
  final int? v;
  final int? commentCount;
  int? likes;
  final String? type;

  factory PodCastModel.fromJson(Map<String, dynamic> json) {
    return PodCastModel(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      titleKu: json["title_ku"],
      titleEn: json["title_en"],
      titleAr: json["title_ar"],
      contentKu: json["content_ku"],
      contentAr: json["content_ar"],
      contentEn: json["content_en"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      videos: json["videos"] == null
          ? []
          : List<String>.from(json["videos"]!.map((x) => x)),
      contentType: json["contentType"],
      isLiked: json["isLiked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      v: json["__v"],
      commentCount: json["commentCount"],
      likes: json["likes"],
      type: json["type"],
    );
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.education,
    required this.profilePicture,
    required this.usePictureAsLink,
    required this.level,
    required this.speciality,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final List<Education> education;
  final ProfilePicture? profilePicture;
  final bool? usePictureAsLink;
  final Level? level;
  final Speciality? speciality;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"]!.map((x) => Education.fromJson(x))),
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      usePictureAsLink: json["usePictureAsLink"],
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
    );
  }
}
