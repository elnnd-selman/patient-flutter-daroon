import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  UserModel({
    required this.user,
    required this.token,
    required this.success,
    required this.message,
  });
  @HiveField(0)
  final User? user;
  @HiveField(1)
  final String? token;
  @HiveField(2)
  final bool? success;
  @HiveField(3)
  final String? message;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      token: json["token"],
      success: json["success"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
        "success": success,
        "message": message,
      };

  @override
  String toString() {
    return "$user, $token, $success, $message, ";
  }
}

@HiveType(typeId: 2)
class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.fullName,
    required this.email,
    required this.isEmailVerified,
    required this.level,
    required this.password,
    required this.isActive,
    required this.gender,
    required this.phone,
    required this.bio,
    required this.education,
    required this.experienceByYear,
    required this.typeOfUser,
    required this.listOfAssistants,
    required this.language,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.sessionToken,
    required this.profilePicture,
  });
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? username;
  @HiveField(3)
  final String? fullName;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final bool? isEmailVerified;
  @HiveField(6)
  final String? level;
  @HiveField(7)
  final String? password;
  @HiveField(8)
  final bool? isActive;
  @HiveField(9)
  final String? gender;
  @HiveField(10)
  final Phone? phone;
  @HiveField(11)
  final String? bio;
  @HiveField(12)
  final List<Education> education;
  @HiveField(13)
  final int? experienceByYear;
  @HiveField(14)
  final String? typeOfUser;
  @HiveField(15)
  final List<dynamic> listOfAssistants;
  @HiveField(16)
  final String? language;
  @HiveField(17)
  final DateTime? createdAt;
  @HiveField(18)
  final DateTime? updatedAt;
  @HiveField(19)
  final int? v;
  @HiveField(20)
  final String? sessionToken;
  @HiveField(21)
  final dynamic profilePicture;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      name: json["name"],
      username: json["username"],
      fullName: json["fullName"],
      email: json["email"],
      isEmailVerified: json["isEmailVerified"],
      level: json["level"],
      password: json["password"],
      isActive: json["isActive"],
      gender: json["gender"],
      phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
      bio: json["bio"],
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"]!.map((x) => Education.fromJson(x))),
      experienceByYear: json["experienceByYear"],
      typeOfUser: json["typeOfUser"],
      listOfAssistants: json["listOfAssistants"] == null
          ? []
          : List<dynamic>.from(json["listOfAssistants"]!.map((x) => x)),
      language: json["language"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      sessionToken: json["sessionToken"],
      profilePicture: json["profilePicture"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "fullName": fullName,
        "email": email,
        "isEmailVerified": isEmailVerified,
        "level": level,
        "password": password,
        "isActive": isActive,
        "gender": gender,
        "phone": phone?.toJson(),
        "bio": bio,
        "education": education.map((x) => x.toJson()).toList(),
        "experienceByYear": experienceByYear,
        "typeOfUser": typeOfUser,
        "listOfAssistants": listOfAssistants.map((x) => x).toList(),
        "language": language,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "sessionToken": sessionToken,
        "profilePicture": profilePicture,
      };

  @override
  String toString() {
    return "$id, $name, $username, $fullName, $email, $isEmailVerified, $level, $password, $isActive, $gender, $phone, $bio, $education, $experienceByYear, $typeOfUser, $listOfAssistants, $language, $createdAt, $updatedAt, $v, $sessionToken, $profilePicture, ";
  }
}

@HiveType(typeId: 3)
class Education {
  Education({
    required this.degree,
    required this.fromYear,
    required this.toYear,
    required this.institute,
    required this.id,
  });
  @HiveField(0)
  final String? degree;
  @HiveField(1)
  final String? fromYear;
  @HiveField(2)
  final String? toYear;
  @HiveField(3)
  final String? institute;
  @HiveField(4)
  final String? id;

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json["degree"],
      fromYear: json["fromYear"],
      toYear: json["toYear"],
      institute: json["institute"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "fromYear": fromYear,
        "toYear": toYear,
        "institute": institute,
        "_id": id,
      };

  @override
  String toString() {
    return "$degree, $fromYear, $toYear, $institute, $id, ";
  }
}

@HiveType(typeId: 4)
class Phone {
  Phone({
    required this.number,
    required this.isVerified,
  });

  @HiveField(0)
  final String? number;
  @HiveField(1)
  final bool? isVerified;

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      number: json["number"],
      isVerified: json["isVerified"],
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "isVerified": isVerified,
      };

  @override
  String toString() {
    return "$number, $isVerified, ";
  }
}
