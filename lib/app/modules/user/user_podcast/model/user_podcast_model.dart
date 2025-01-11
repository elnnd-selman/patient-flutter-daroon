import 'package:daroon_user/app/model/level_model.dart';

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
  final String? profilePicture;
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
      profilePicture: json["profilePicture"],
      usePictureAsLink: json["usePictureAsLink"],
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
    );
  }
}

class Education {
  Education({
    required this.id,
    required this.degree,
    required this.fromYear,
    required this.toYear,
    required this.instituteAr,
    required this.instituteEn,
    required this.instituteKu,
    required this.degreeNameAr,
    required this.degreeNameEn,
    required this.degreeNameKu,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? degree;
  final String? fromYear;
  final String? toYear;
  final String? instituteAr;
  final String? instituteEn;
  final String? instituteKu;
  final String? degreeNameAr;
  final String? degreeNameEn;
  final String? degreeNameKu;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json["_id"],
      degree: json["degree"],
      fromYear: json["fromYear"],
      toYear: json["toYear"],
      instituteAr: json["institute_ar"],
      instituteEn: json["institute_en"],
      instituteKu: json["institute_ku"],
      degreeNameAr: json["degreeName_ar"],
      degreeNameEn: json["degreeName_en"],
      degreeNameKu: json["degreeName_ku"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}


class Speciality {
  Speciality({
    required this.id,
    required this.specialityKu,
    required this.specialityAr,
    required this.specialityEn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? specialityKu;
  final String? specialityAr;
  final String? specialityEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json["_id"],
      specialityKu: json["speciality_ku"],
      specialityAr: json["speciality_ar"],
      specialityEn: json["speciality_en"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
