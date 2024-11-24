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
      profilePicture: json["profilePicture"] == null
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      isDeleted: json["isDeleted"],
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
    );
  }
}

class Level {
  Level({
    required this.id,
    required this.levelKu,
    required this.levelAr,
    required this.levelEn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? levelKu;
  final String? levelAr;
  final String? levelEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json["_id"],
      levelKu: json["level_ku"],
      levelAr: json["level_ar"],
      levelEn: json["level_en"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class ProfilePicture {
  ProfilePicture({
    required this.bg,
    required this.md,
    required this.sm,
  });

  final String? bg;
  final String? md;
  final String? sm;

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
      bg: json["bg"],
      md: json["md"],
      sm: json["sm"],
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
    required this.image,
  });

  final String? id;
  final String? specialityKu;
  final String? specialityAr;
  final String? specialityEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? image;

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json["_id"],
      specialityKu: json["speciality_ku"],
      specialityAr: json["speciality_ar"],
      specialityEn: json["speciality_en"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      image: json["image"],
    );
  }
}
