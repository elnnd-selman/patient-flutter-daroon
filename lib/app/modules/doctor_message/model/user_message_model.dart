class UserMessageModel {
  UserMessageModel({
    required this.success,
    required this.message,
    required this.status,
    required this.data,
  });

  final bool? success;
  final String? message;
  final int? status;
  final List<UserMessageModelData> data;

  factory UserMessageModel.fromJson(Map<String, dynamic> json) {
    return UserMessageModel(
      success: json["success"],
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<UserMessageModelData>.from(
              json["data"]!.map((x) => UserMessageModelData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class UserMessageModelData {
  UserMessageModelData({
    required this.id,
    required this.patient,
    required this.doctor,
    required this.office,
    required this.inTimeStartingConversation,
    required this.inTimeEndingConversation,
    required this.invoice,
    required this.duration,
    required this.timeType,
    required this.types,
    required this.appointment,
    required this.isActive,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final Doctor? patient;
  final Doctor? doctor;
  final Office? office;
  final String? inTimeStartingConversation;
  final String? inTimeEndingConversation;
  final String? invoice;
  final int? duration;
  final String? timeType;
  final List<String> types;
  final String? appointment;
  final bool? isActive;
  final List<dynamic> messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory UserMessageModelData.fromJson(Map<String, dynamic> json) {
    return UserMessageModelData(
      id: json["_id"],
      patient:
          json["patient"] == null ? null : Doctor.fromJson(json["patient"]),
      doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
      office: json["office"] == null ? null : Office.fromJson(json["office"]),
      inTimeStartingConversation: json["inTimeStartingConversation"],
      inTimeEndingConversation: json["inTimeEndingConversation"],
      invoice: json["invoice"],
      duration: json["duration"],
      timeType: json["timeType"],
      types: json["types"] == null
          ? []
          : List<String>.from(json["types"]!.map((x) => x)),
      appointment: json["appointment"],
      isActive: json["isActive"],
      messages: json["messages"] == null
          ? []
          : List<dynamic>.from(json["messages"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "patient": patient?.toJson(),
        "doctor": doctor?.toJson(),
        "office": office?.toJson(),
        "inTimeStartingConversation": inTimeStartingConversation,
        "inTimeEndingConversation": inTimeEndingConversation,
        "invoice": invoice,
        "duration": duration,
        "timeType": timeType,
        "types": types.map((x) => x).toList(),
        "appointment": appointment,
        "isActive": isActive,
        "messages": messages.map((x) => x).toList(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Doctor {
  Doctor({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.gender,
    required this.education,
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
  final List<Education> education;
  final String? lastNameKu;
  final String? lastNameAr;
  final String? lastNameEn;
  final ProfilePicture? profilePicture;
  final bool? isThirdParty;
  final bool? usePictureAsLink;
  final DateTime? dateOfBirth;

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      gender: json["gender"],
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"]!.map((x) => Education.fromJson(x))),
      lastNameKu: json["lastName_ku"],
      lastNameAr: json["lastName_ar"],
      lastNameEn: json["lastName_en"],
      profilePicture: json["profilePicture"] == null
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
        "education": education.map((x) => x.toJson()).toList(),
        "lastName_ku": lastNameKu,
        "lastName_ar": lastNameAr,
        "lastName_en": lastNameEn,
        "profilePicture": profilePicture?.toJson(),
        "isThirdParty": isThirdParty,
        "usePictureAsLink": usePictureAsLink,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
      };
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
    required this.isDeleted,
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
  final bool? isDeleted;
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
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "degree": degree,
        "fromYear": fromYear,
        "toYear": toYear,
        "institute_ar": instituteAr,
        "institute_en": instituteEn,
        "institute_ku": instituteKu,
        "degreeName_ar": degreeNameAr,
        "degreeName_en": degreeNameEn,
        "degreeName_ku": degreeNameKu,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
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

  Map<String, dynamic> toJson() => {
        "bg": bg,
        "md": md,
        "sm": sm,
      };
}

class Office {
  Office({
    required this.id,
    required this.title,
    required this.description,
    required this.room,
    required this.floor,
    required this.buildingNumber,
  });

  final String? id;
  final String? title;
  final String? description;
  final int? room;
  final int? floor;
  final int? buildingNumber;

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      room: json["room"],
      floor: json["floor"],
      buildingNumber: json["buildingNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "room": room,
        "floor": floor,
        "buildingNumber": buildingNumber,
      };
}
