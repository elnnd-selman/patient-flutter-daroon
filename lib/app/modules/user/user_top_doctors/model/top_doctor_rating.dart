class DoctorRatingModel {
  DoctorRatingModel({
    required this.id,
    required this.appointment,
    required this.patient,
    required this.rate,
    required this.comment,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final Appointment? appointment;
  final Patient? patient;
  dynamic rate;
  final String? comment;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory DoctorRatingModel.fromJson(Map<String, dynamic> json) {
    return DoctorRatingModel(
      id: json["_id"],
      appointment: json["appointment"] == null
          ? null
          : Appointment.fromJson(json["appointment"]),
      patient:
          json["patient"] == null ? null : Patient.fromJson(json["patient"]),
      rate: json["rate"],
      comment: json["comment"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Appointment {
  Appointment({
    required this.id,
    required this.status,
  });

  final String? id;
  final String? status;

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json["_id"],
      status: json["status"],
    );
  }
}

class Patient {
  Patient({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.education,
    required this.profilePicture,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? username;
  final List<dynamic> education;
  final ProfilePicture? profilePicture;

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      education: json["education"] == null
          ? []
          : List<dynamic>.from(json["education"]!.map((x) => x)),
      profilePicture: json["profilePicture"] == null
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
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
