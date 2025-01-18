import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/model/profile_picture_model.dart';
import 'package:daroon_user/app/model/specialty_model.dart';

class UserPresenterModel {
  UserPresenterModel({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.gender,
    required this.biographyKu,
    required this.biographyAr,
    required this.biographyEn,
    required this.isActive,
    required this.speciality,
    required this.education,
    required this.lastNameKu,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.experienceByYear,
    required this.languages,
    required this.profilePicture,
    required this.dateOfBirth,
    required this.isDeleted,
    required this.level,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? gender;
  final String? biographyKu;
  final String? biographyAr;
  final String? biographyEn;
  final bool? isActive;
  final Speciality? speciality;
  final List<dynamic> education;
  final String? lastNameKu;
  final String? lastNameAr;
  final String? lastNameEn;
  final int? experienceByYear;
  final List<String> languages;
  final ProfilePicture? profilePicture;
  final DateTime? dateOfBirth;
  final bool? isDeleted;
  final Level? level;

  factory UserPresenterModel.fromJson(Map<String, dynamic> json) {
    return UserPresenterModel(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      gender: json["gender"],
      biographyKu: json["biography_ku"],
      biographyAr: json["biography_ar"],
      biographyEn: json["biography_en"],
      isActive: json["isActive"],
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      education: json["education"] == null
          ? []
          : List<dynamic>.from(json["education"]!.map((x) => x)),
      lastNameKu: json["lastName_ku"],
      lastNameAr: json["lastName_ar"],
      lastNameEn: json["lastName_en"],
      experienceByYear: json["experienceByYear"],
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      isDeleted: json["isDeleted"],
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
    );
  }
}
