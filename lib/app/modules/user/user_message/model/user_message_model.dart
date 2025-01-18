import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/model/profile_picture_model.dart';
import 'package:daroon_user/app/model/specialty_model.dart';

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
    required this.meetingInfo,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final PatientClass? patient;
  final PatientClass? doctor;
  final Office? office;
  final String? inTimeStartingConversation;
  final String? inTimeEndingConversation;
  final String? invoice;
  final int? duration;
  final String? timeType;
  final List<String> types;
  final Appointment? appointment;
  final bool? isActive;
  final MeetingInfo? meetingInfo;
  final List<dynamic> messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory UserMessageModelData.fromJson(Map<String, dynamic> json) {
    return UserMessageModelData(
      id: json["_id"],
      patient: json["patient"] == null
          ? null
          : PatientClass.fromJson(json["patient"]),
      doctor:
          json["doctor"] == null ? null : PatientClass.fromJson(json["doctor"]),
      office: json["office"] == null ? null : Office.fromJson(json["office"]),
      inTimeStartingConversation: json["inTimeStartingConversation"],
      inTimeEndingConversation: json["inTimeEndingConversation"],
      invoice: json["invoice"],
      duration: json["duration"],
      timeType: json["timeType"],
      types: json["types"] == null
          ? []
          : List<String>.from(json["types"]!.map((x) => x)),
      appointment: json["appointment"] == null
          ? null
          : Appointment.fromJson(json["appointment"]),
      isActive: json["isActive"],
      meetingInfo: json["meeting_info"] == null
          ? null
          : MeetingInfo.fromJson(json["meeting_info"]),
      messages: json["messages"] == null
          ? []
          : List<dynamic>.from(json["messages"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Appointment {
  Appointment({
    required this.id,
    required this.selectedDay,
    required this.selectedTime,
    required this.isPaid,
    required this.amountPaid,
    required this.currencyPaid,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.extraInformation,
    required this.appointmentDate,
    required this.dateOfBirth,
    required this.appointmentType,
    required this.selfBooked,
    required this.bookedFor,
    required this.bookedBy,
    required this.status,
    required this.cancelledReason,
  });

  final String? id;
  final String? selectedDay;
  final String? selectedTime;
  final bool? isPaid;
  final int? amountPaid;
  final String? currencyPaid;
  final String? fullName;
  final int? age;
  final String? gender;
  final String? extraInformation;
  final DateTime? appointmentDate;
  final DateTime? dateOfBirth;
  final List<String> appointmentType;
  final bool? selfBooked;
  final String? bookedFor;
  final String? bookedBy;
  final String? status;
  final dynamic cancelledReason;

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json["_id"],
      selectedDay: json["selectedDay"],
      selectedTime: json["selectedTime"],
      isPaid: json["isPaid"],
      amountPaid: json["amountPaid"],
      currencyPaid: json["currencyPaid"],
      fullName: json["fullName"],
      age: json["age"],
      gender: json["gender"],
      extraInformation: json["extraInformation"],
      appointmentDate: DateTime.tryParse(json["appointmentDate"] ?? ""),
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      appointmentType: json["appointmentType"] == null
          ? []
          : List<String>.from(json["appointmentType"]!.map((x) => x)),
      selfBooked: json["selfBooked"],
      bookedFor: json["bookedFor"],
      bookedBy: json["bookedBy"],
      status: json["status"],
      cancelledReason: json["cancelledReason"],
    );
  }
}

class PatientClass {
  PatientClass({
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
    required this.speciality,
    required this.level,
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
  final Speciality? speciality;
  final Level? level;

  factory PatientClass.fromJson(Map<String, dynamic> json) {
    return PatientClass(
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
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      isThirdParty: json["isThirdParty"],
      usePictureAsLink: json["usePictureAsLink"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
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
}

class MeetingInfo {
  MeetingInfo({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory MeetingInfo.fromJson(Map<String, dynamic> json) {
    return MeetingInfo(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.recordOnStart,
    required this.liveStreamOnStart,
    required this.persistChat,
    required this.summarizeOnEnd,
    required this.isLarge,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? title;
  final bool? recordOnStart;
  final bool? liveStreamOnStart;
  final bool? persistChat;
  final bool? summarizeOnEnd;
  final bool? isLarge;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      title: json["title"],
      recordOnStart: json["record_on_start"],
      liveStreamOnStart: json["live_stream_on_start"],
      persistChat: json["persist_chat"],
      summarizeOnEnd: json["summarize_on_end"],
      isLarge: json["is_large"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}

class Office {
  Office({
    required this.id,
    required this.doctor,
    required this.title,
    required this.description,
    required this.typeOfCurrency,
    required this.address,
  });

  final String? id;
  final OfficeDoctor? doctor;
  final String? title;
  final String? description;
  final TypeOfCurrency? typeOfCurrency;
  final Address? address;

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json["_id"],
      doctor:
          json["doctor"] == null ? null : OfficeDoctor.fromJson(json["doctor"]),
      title: json["title"],
      description: json["description"],
      typeOfCurrency: json["typeOfCurrency"] == null
          ? null
          : TypeOfCurrency.fromJson(json["typeOfCurrency"]),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
    );
  }
}

class Address {
  Address({
    required this.country,
    required this.typeOfOffice,
  });

  final Country? country;
  final TypeOfOffice? typeOfOffice;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      typeOfOffice: json["typeOfOffice"] == null
          ? null
          : TypeOfOffice.fromJson(json["typeOfOffice"]),
    );
  }
}

class Country {
  Country({
    required this.id,
    required this.countryKu,
    required this.countryAr,
    required this.countryEn,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? countryKu;
  final String? countryAr;
  final String? countryEn;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["_id"],
      countryKu: json["country_ku"],
      countryAr: json["country_ar"],
      countryEn: json["country_en"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class TypeOfOffice {
  TypeOfOffice({
    required this.id,
    required this.typeOfOfficeKu,
    required this.typeOfOfficeAr,
    required this.typeOfOfficeEn,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? typeOfOfficeKu;
  final String? typeOfOfficeAr;
  final String? typeOfOfficeEn;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory TypeOfOffice.fromJson(Map<String, dynamic> json) {
    return TypeOfOffice(
      id: json["_id"],
      typeOfOfficeKu: json["typeOfOffice_ku"],
      typeOfOfficeAr: json["typeOfOffice_ar"],
      typeOfOfficeEn: json["typeOfOffice_en"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class OfficeDoctor {
  OfficeDoctor({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.email,
    required this.isEmailVerified,
    required this.gender,
    required this.password,
    required this.isActive,
    required this.phone,
    required this.education,
    required this.lastNameKu,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.experienceByYear,
    required this.typeOfUser,
    required this.languages,
    required this.appLang,
    required this.backgroundPicture,
    required this.profilePicture,
    required this.isThirdParty,
    required this.usePictureAsLink,
    required this.dateOfBirth,
    required this.isVip,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.sessionToken,
    required this.speciality,
    required this.level,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? username;
  final String? email;
  final bool? isEmailVerified;
  final String? gender;
  final String? password;
  final bool? isActive;
  final Phone? phone;
  final List<Education> education;
  final String? lastNameKu;
  final String? lastNameAr;
  final String? lastNameEn;
  final int? experienceByYear;
  final String? typeOfUser;
  final List<String> languages;
  final String? appLang;
  final dynamic backgroundPicture;
  final ProfilePicture? profilePicture;
  final bool? isThirdParty;
  final bool? usePictureAsLink;
  final DateTime? dateOfBirth;
  final bool? isVip;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? sessionToken;
  final Speciality? speciality;
  final Level? level;

  factory OfficeDoctor.fromJson(Map<String, dynamic> json) {
    return OfficeDoctor(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      email: json["email"],
      isEmailVerified: json["isEmailVerified"],
      gender: json["gender"],
      password: json["password"],
      isActive: json["isActive"],
      phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"]!.map((x) => Education.fromJson(x))),
      lastNameKu: json["lastName_ku"],
      lastNameAr: json["lastName_ar"],
      lastNameEn: json["lastName_en"],
      experienceByYear: json["experienceByYear"],
      typeOfUser: json["typeOfUser"],
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      appLang: json["appLang"],
      backgroundPicture: json["background_picture"],
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      isThirdParty: json["isThirdParty"],
      usePictureAsLink: json["usePictureAsLink"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      isVip: json["is_vip"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      sessionToken: json["sessionToken"],
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
    );
  }
}

class Phone {
  Phone({
    required this.number,
    required this.isVerified,
  });

  final String? number;
  final bool? isVerified;

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      number: json["number"],
      isVerified: json["isVerified"],
    );
  }
}

class TypeOfCurrency {
  TypeOfCurrency({
    required this.id,
    required this.typeOfCurrencyKu,
    required this.typeOfCurrencyAr,
    required this.typeOfCurrencyEn,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? typeOfCurrencyKu;
  final String? typeOfCurrencyAr;
  final String? typeOfCurrencyEn;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory TypeOfCurrency.fromJson(Map<String, dynamic> json) {
    return TypeOfCurrency(
      id: json["_id"],
      typeOfCurrencyKu: json["typeOfCurrency_ku"],
      typeOfCurrencyAr: json["typeOfCurrency_ar"],
      typeOfCurrencyEn: json["typeOfCurrency_en"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
