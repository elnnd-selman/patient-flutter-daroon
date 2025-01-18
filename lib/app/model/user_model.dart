import 'package:daroon_user/app/model/user_profile_picture.dart';
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
    required this.typeOfUser,
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
  final String? typeOfUser;
  @HiveField(13)
  final String? language;
  @HiveField(14)
  final DateTime? createdAt;
  @HiveField(15)
  final DateTime? updatedAt;
  @HiveField(16)
  final int? v;
  @HiveField(17)
  final String? sessionToken;
  @HiveField(18)
  final UserProfilePicture? profilePicture;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      typeOfUser: json["typeOfUser"],
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
      language: json["language"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      sessionToken: json["sessionToken"],
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String ||
              json["profilePicture"] == ""
          ? null
          : UserProfilePicture.fromJson(json["profilePicture"]),
    );
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
