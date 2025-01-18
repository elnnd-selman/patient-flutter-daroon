import 'package:daroon_user/app/model/education_model.dart';
import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/model/profile_picture_model.dart';
import 'package:daroon_user/app/model/specialty_model.dart';

class TopDoctorModel {
  TopDoctorModel({
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
    required this.level,
    required this.speciality,
    required this.education,
    required this.lastNameKu,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.experienceByYear,
    required this.languages,
    required this.backgroundPicture,
    required this.profilePicture,
    required this.dateOfBirth,
    required this.isVip,
    required this.isDeleted,
    required this.lastLogin,
    required this.averageRatting,
    required this.completedAppointments,
    required this.offices,
    required this.reviews,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? gender;
  final dynamic biographyKu;
  final dynamic biographyAr;
  final String? biographyEn;
  final bool? isActive;
  final Level? level;
  final Speciality? speciality;
  final List<Education> education;
  final String? lastNameKu;
  final String? lastNameAr;
  final String? lastNameEn;
  final int? experienceByYear;
  final List<String> languages;
  final dynamic backgroundPicture;
  final ProfilePicture? profilePicture;
  final DateTime? dateOfBirth;
  final bool? isVip;
  final bool? isDeleted;
  final DateTime? lastLogin;
  final int? averageRatting;
  final int? completedAppointments;
  final List<Office> offices;
  final List<dynamic> reviews;

  factory TopDoctorModel.fromJson(Map<String, dynamic> json) {
    return TopDoctorModel(
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
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"]!.map((x) => Education.fromJson(x))),
      lastNameKu: json["lastName_ku"],
      lastNameAr: json["lastName_ar"],
      lastNameEn: json["lastName_en"],
      experienceByYear: json["experienceByYear"],
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      backgroundPicture: json["background_picture"],
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      isVip: json["is_vip"],
      isDeleted: json["isDeleted"],
      lastLogin: DateTime.tryParse(json["lastLogin"] ?? ""),
      averageRatting: json["average_ratting"],
      completedAppointments: json["completed_appointments"],
      offices: json["offices"] == null
          ? []
          : List<Office>.from(json["offices"]!.map((x) => Office.fromJson(x))),
      reviews: json["reviews"] == null
          ? []
          : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    );
  }
}

class Office {
  Office({
    required this.fee,
    required this.address,
    required this.id,
    required this.doctor,
    required this.title,
    required this.description,
    required this.daysOpen,
    required this.startTime,
    required this.endTime,
    required this.appointmentDuration,
    required this.appointmentTimeType,
    required this.typeOfCurrency,
    required this.phoneNumbers,
    required this.isDeleted,
    required this.appointmentTimes,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final Fee? fee;
  final Address? address;
  final String? id;
  final Doctor? doctor;
  final String? title;
  final String? description;
  final List<String> daysOpen;
  final String? startTime;
  final String? endTime;
  final int? appointmentDuration;
  final String? appointmentTimeType;
  final TypeOfCurrency? typeOfCurrency;
  final List<String> phoneNumbers;
  final bool? isDeleted;
  final AppointmentTimes? appointmentTimes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      fee: json["fee"] == null ? null : Fee.fromJson(json["fee"]),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      id: json["_id"],
      doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
      title: json["title"],
      description: json["description"],
      daysOpen: json["daysOpen"] == null
          ? []
          : List<String>.from(json["daysOpen"]!.map((x) => x)),
      startTime: json["startTime"],
      endTime: json["endTime"],
      appointmentDuration: json["appointmentDuration"],
      appointmentTimeType: json["appointmentTimeType"],
      typeOfCurrency: json["typeOfCurrency"] == null
          ? null
          : TypeOfCurrency.fromJson(json["typeOfCurrency"]),
      phoneNumbers: json["phoneNumbers"] == null
          ? []
          : List<String>.from(json["phoneNumbers"]!.map((x) => x)),
      isDeleted: json["isDeleted"],
      appointmentTimes: json["appointmentTimes"] == null
          ? null
          : AppointmentTimes.fromJson(json["appointmentTimes"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Address {
  Address({
    required this.coordinate,
    required this.country,
    required this.city,
    required this.town,
    required this.street,
    required this.typeOfOffice,
  });

  final Coordinate? coordinate;
  final Country? country;
  final String? city;
  final String? town;
  final String? street;
  final TypeOfOffice? typeOfOffice;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      coordinate: json["coordinate"] == null
          ? null
          : Coordinate.fromJson(json["coordinate"]),
      country:
          json["country"] == null ? null : Country.fromJson(json["country"]),
      city: json["city"],
      town: json["town"],
      street: json["street"],
      typeOfOffice: json["typeOfOffice"] == null
          ? null
          : TypeOfOffice.fromJson(json["typeOfOffice"]),
    );
  }
}

class Coordinate {
  Coordinate({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      latitude: json["latitude"],
      longitude: json["longitude"],
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
    required this.image,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? typeOfOfficeKu;
  final String? typeOfOfficeAr;
  final String? typeOfOfficeEn;
  final String? image;
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
      image: json["image"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class AppointmentTimes {
  AppointmentTimes({
    required this.monday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.tuesday,
    required this.sunday,
  });

  final List<Day> monday;
  final List<Day> wednesday;
  final List<Day> thursday;
  final List<Day> friday;
  final List<Day> saturday;
  final List<Day> tuesday;
  final List<Day> sunday;

  factory AppointmentTimes.fromJson(Map<String, dynamic> json) {
    return AppointmentTimes(
      monday: json["monday"] == null
          ? []
          : List<Day>.from(json["monday"]!.map((x) => Day.fromJson(x))),
      wednesday: json["wednesday"] == null
          ? []
          : List<Day>.from(json["wednesday"]!.map((x) => Day.fromJson(x))),
      thursday: json["thursday"] == null
          ? []
          : List<Day>.from(json["thursday"]!.map((x) => Day.fromJson(x))),
      friday: json["friday"] == null
          ? []
          : List<Day>.from(json["friday"]!.map((x) => Day.fromJson(x))),
      saturday: json["saturday"] == null
          ? []
          : List<Day>.from(json["saturday"]!.map((x) => Day.fromJson(x))),
      tuesday: json["tuesday"] == null
          ? []
          : List<Day>.from(json["tuesday"]!.map((x) => Day.fromJson(x))),
      sunday: json["sunday"] == null
          ? []
          : List<Day>.from(json["sunday"]!.map((x) => Day.fromJson(x))),
    );
  }
}

class Day {
  Day({
    required this.time,
    required this.isBooked,
  });

  final String? time;
  final bool? isBooked;

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      time: json["time"],
      isBooked: json["isBooked"],
    );
  }
}

class Doctor {
  Doctor({
    required this.phone,
    required this.biographyKu,
    required this.biographyAr,
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.email,
    required this.isEmailVerified,
    required this.gender,
    required this.isActive,
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
    required this.lastLogin,
    required this.speciality,
    required this.level,
    required this.biographyEn,
  });

  final Phone? phone;
  final dynamic biographyKu;
  final dynamic biographyAr;
  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? username;
  final String? email;
  final bool? isEmailVerified;
  final String? gender;
  final bool? isActive;
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
  final DateTime? lastLogin;
  final Speciality? speciality;
  final Level? level;
  final String? biographyEn;

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
      biographyKu: json["biography_ku"],
      biographyAr: json["biography_ar"],
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      email: json["email"],
      isEmailVerified: json["isEmailVerified"],
      gender: json["gender"],
      isActive: json["isActive"],
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
      lastLogin: DateTime.tryParse(json["lastLogin"] ?? ""),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      biographyEn: json["biography_en"],
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

class Fee {
  Fee({
    required this.feeClinic,
    required this.feeMessage,
    required this.feeCall,
    required this.feeVideoCall,
  });

  final int? feeClinic;
  final int? feeMessage;
  final int? feeCall;
  final int? feeVideoCall;

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      feeClinic: json["feeClinic"],
      feeMessage: json["feeMessage"],
      feeCall: json["feeCall"],
      feeVideoCall: json["feeVideoCall"],
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
