import 'package:daroon_user/app/model/education_model.dart';
import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/model/profile_picture_model.dart';
import 'package:daroon_user/app/model/specialty_model.dart';

import '../../../../model/type_currency_model.dart';

class AppointmentModel {
  AppointmentModel({
    required this.id,
    required this.office,
    required this.doctor,
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
    required this.isDeleted,
    required this.patientName,
    required this.doctorName,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.isReviewed,
    required this.isReviewedByMe,
    required this.conversation,
    required this.invoice,
  });

  final String? id;
  final Office? office;
  final DatumDoctor? doctor;
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
  final BookedBy? bookedBy;
  final String? status;
  final dynamic cancelledReason;
  final bool? isDeleted;
  final String? patientName;
  final String? doctorName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final bool? isReviewed;
  final bool? isReviewedByMe;
  final Conversation? conversation;
  final Invoice? invoice;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json["_id"],
      office: json["office"] == null ? null : Office.fromJson(json["office"]),
      doctor:
          json["doctor"] == null ? null : DatumDoctor.fromJson(json["doctor"]),
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
      bookedBy:
          json["bookedBy"] == null ? null : BookedBy.fromJson(json["bookedBy"]),
      status: json["status"],
      cancelledReason: json["cancelledReason"],
      isDeleted: json["isDeleted"],
      patientName: json["patientName"],
      doctorName: json["doctorName"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      isReviewed: json["is_reviewed"],
      isReviewedByMe: json["is_reviewed_by_me"],
      conversation: json["conversation"] == null
          ? null
          : Conversation.fromJson(json["conversation"]),
      invoice:
          json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
    );
  }
}

class BookedBy {
  BookedBy({
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

  factory BookedBy.fromJson(Map<String, dynamic> json) {
    return BookedBy(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      education: json["education"] == null
          ? []
          : List<dynamic>.from(json["education"]!.map((x) => x)),
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
    );
  }
}

class Conversation {
  Conversation({
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
  final String? patient;
  final String? doctor;
  final String? office;
  final String? inTimeStartingConversation;
  final String? inTimeEndingConversation;
  final String? invoice;
  final int? duration;
  final String? timeType;
  final List<String> types;
  final String? appointment;
  final bool? isActive;
  final dynamic meetingInfo;
  final List<dynamic> messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json["_id"],
      patient: json["patient"],
      doctor: json["doctor"],
      office: json["office"],
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
      meetingInfo: json["meeting_info"],
      messages: json["messages"] == null
          ? []
          : List<dynamic>.from(json["messages"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class DatumDoctor {
  DatumDoctor({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.education,
    required this.profilePicture,
    required this.speciality,
    required this.level,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? username;
  final List<Education> education;
  final ProfilePicture? profilePicture;
  final Speciality? speciality;
  final Level? level;

  factory DatumDoctor.fromJson(Map<String, dynamic> json) {
    return DatumDoctor(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      education: json["education"] == null
          ? []
          : List<Education>.from(
              json["education"]!.map((x) => Education.fromJson(x))),
      profilePicture: json["profilePicture"] == null ||
              json["profilePicture"].runtimeType == String
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
    );
  }
}

class Invoice {
  Invoice({
    required this.id,
    required this.user,
    required this.appointment,
    required this.currency,
    required this.totalAmount,
    required this.originalTotal,
    required this.patientName,
    required this.doctorName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.invoiceNumber,
    required this.v,
    required this.paymentId,
    required this.transaction,
  });

  final String? id;
  final String? user;
  final String? appointment;
  final String? currency;
  final int? totalAmount;
  final int? originalTotal;
  final String? patientName;
  final String? doctorName;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? invoiceNumber;
  final int? v;
  final String? paymentId;
  final Transaction? transaction;

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json["_id"],
      user: json["user"],
      appointment: json["appointment"],
      currency: json["currency"],
      totalAmount: json["totalAmount"],
      originalTotal: json["originalTotal"],
      patientName: json["patientName"],
      doctorName: json["doctorName"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      invoiceNumber: json["invoiceNumber"],
      v: json["__v"],
      paymentId: json["paymentId"],
      transaction: json["transaction"] == null
          ? null
          : Transaction.fromJson(json["transaction"]),
    );
  }
}

class Transaction {
  Transaction({
    required this.succuess,
    required this.message,
    required this.data,
  });

  final bool? succuess;
  final String? message;
  final Data? data;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      succuess: json["succuess"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.paymentId,
    required this.readableCode,
    required this.qrCode,
    required this.validUntil,
    required this.personalAppLink,
    required this.businessAppLink,
    required this.corporateAppLink,
  });

  final String? paymentId;
  final String? readableCode;
  final String? qrCode;
  final DateTime? validUntil;
  final String? personalAppLink;
  final String? businessAppLink;
  final String? corporateAppLink;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      paymentId: json["paymentId"],
      readableCode: json["readableCode"],
      qrCode: json["qrCode"],
      validUntil: DateTime.tryParse(json["validUntil"] ?? ""),
      personalAppLink: json["personalAppLink"],
      businessAppLink: json["businessAppLink"],
      corporateAppLink: json["corporateAppLink"],
    );
  }
}

class Office {
  Office({
    required this.id,
    required this.doctor,
    required this.title,
    required this.description,
    required this.appointmentTimeType,
    required this.typeOfCurrency,
    required this.address,
    required this.appointmentTimes,
  });

  final String? id;
  final OfficeDoctor? doctor;
  final String? title;
  final String? description;
  final String? appointmentTimeType;
  final TypeOfCurrency? typeOfCurrency;
  final Address? address;
  final AppointmentTimes? appointmentTimes;

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json["_id"],
      doctor:
          json["doctor"] == null ? null : OfficeDoctor.fromJson(json["doctor"]),
      title: json["title"],
      description: json["description"],
      appointmentTimeType: json["appointmentTimeType"],
      typeOfCurrency: json["typeOfCurrency"] == null
          ? null
          : TypeOfCurrency.fromJson(json["typeOfCurrency"]),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      appointmentTimes: json["appointmentTimes"] == null
          ? null
          : AppointmentTimes.fromJson(json["appointmentTimes"]),
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
    required this.thursday,
    required this.monday,
    required this.sunday,
    required this.tuesday,
    required this.wednesday,
    required this.friday,
  });

  final List<Day> thursday;
  final List<Day> monday;
  final List<Day> sunday;
  final List<Day> tuesday;
  final List<Day> wednesday;
  final List<Day> friday;

  factory AppointmentTimes.fromJson(Map<String, dynamic> json) {
    return AppointmentTimes(
      thursday: json["thursday"] == null
          ? []
          : List<Day>.from(json["thursday"]!.map((x) => Day.fromJson(x))),
      monday: json["monday"] == null
          ? []
          : List<Day>.from(json["monday"]!.map((x) => Day.fromJson(x))),
      sunday: json["sunday"] == null
          ? []
          : List<Day>.from(json["sunday"]!.map((x) => Day.fromJson(x))),
      tuesday: json["tuesday"] == null
          ? []
          : List<Day>.from(json["tuesday"]!.map((x) => Day.fromJson(x))),
      wednesday: json["wednesday"] == null
          ? []
          : List<Day>.from(json["wednesday"]!.map((x) => Day.fromJson(x))),
      friday: json["friday"] == null
          ? []
          : List<Day>.from(json["friday"]!.map((x) => Day.fromJson(x))),
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
    required this.lastLogin,
    required this.speciality,
    required this.level,
    required this.biographyEn,
    required this.otp,
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
  final DateTime? lastLogin;
  final Speciality? speciality;
  final Level? level;
  final String? biographyEn;
  final Otp? otp;

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
      lastLogin: DateTime.tryParse(json["lastLogin"] ?? ""),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      biographyEn: json["biography_en"],
      otp: json["otp"] == null ? null : Otp.fromJson(json["otp"]),
    );
  }
}

class Otp {
  Otp({
    required this.code,
    required this.expireAt,
  });

  final String? code;
  final DateTime? expireAt;

  factory Otp.fromJson(Map<String, dynamic> json) {
    return Otp(
      code: json["code"],
      expireAt: DateTime.tryParse(json["expireAt"] ?? ""),
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
