class UserOfferModel {
  UserOfferModel({
    required this.id,
    required this.doctor,
    required this.titleKu,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionKu,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.discountPercentage,
    required this.status,
    required this.currentPrice,
    required this.currency,
    required this.image,
    required this.offices,
    required this.discountedPrice,
    required this.isDeleted,
    required this.startTime,
    required this.endTime,
    required this.bookedNumber,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.acceptedDate,
    required this.rejectedMessage,
  });

  final String? id;
  final DatumDoctor? doctor;
  final String? titleKu;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionKu;
  final String? descriptionAr;
  final String? descriptionEn;
  final int? discountPercentage;
  final String? status;
  final int? currentPrice;
  final Currency? currency;
  final Image? image;
  final List<Office> offices;
  final int? discountedPrice;
  final bool? isDeleted;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? bookedNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final DateTime? acceptedDate;
  final dynamic rejectedMessage;

  factory UserOfferModel.fromJson(Map<String, dynamic> json) {
    return UserOfferModel(
      id: json["_id"],
      doctor:
          json["doctor"] == null ? null : DatumDoctor.fromJson(json["doctor"]),
      titleKu: json["title_ku"],
      titleAr: json["title_ar"],
      titleEn: json["title_en"],
      descriptionKu: json["description_ku"],
      descriptionAr: json["description_ar"],
      descriptionEn: json["description_en"],
      discountPercentage: json["discountPercentage"],
      status: json["status"],
      currentPrice: json["currentPrice"],
      currency:
          json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      offices: json["offices"] == null
          ? []
          : List<Office>.from(json["offices"]!.map((x) => Office.fromJson(x))),
      discountedPrice: json["discountedPrice"],
      isDeleted: json["isDeleted"],
      startTime: DateTime.tryParse(json["startTime"] ?? ""),
      endTime: DateTime.tryParse(json["endTime"] ?? ""),
      bookedNumber: json["booked_number"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      acceptedDate: DateTime.tryParse(json["acceptedDate"] ?? ""),
      rejectedMessage: json["rejectedMessage"],
    );
  }
}

class Currency {
  Currency({
    required this.id,
    required this.typeOfCurrencyKu,
    required this.typeOfCurrencyAr,
    required this.typeOfCurrencyEn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? typeOfCurrencyKu;
  final String? typeOfCurrencyAr;
  final String? typeOfCurrencyEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json["_id"],
      typeOfCurrencyKu: json["typeOfCurrency_ku"],
      typeOfCurrencyAr: json["typeOfCurrency_ar"],
      typeOfCurrencyEn: json["typeOfCurrency_en"],
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
    required this.gender,
    required this.education,
    required this.lastNameKu,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.experienceByYear,
    required this.typeOfUser,
    required this.languages,
    required this.profilePicture,
    required this.usePictureAsLink,
    required this.dateOfBirth,
    required this.level,
    required this.speciality,
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
  final int? experienceByYear;
  final String? typeOfUser;
  final List<String> languages;
  final String? profilePicture;
  final bool? usePictureAsLink;
  final DateTime? dateOfBirth;
  final Level? level;
  final Speciality? speciality;

  factory DatumDoctor.fromJson(Map<String, dynamic> json) {
    return DatumDoctor(
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
      experienceByYear: json["experienceByYear"],
      typeOfUser: json["typeOfUser"],
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      profilePicture: json["profilePicture"],
      usePictureAsLink: json["usePictureAsLink"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
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

class Speciality {
  Speciality({
    required this.id,
    required this.specialityKu,
    required this.specialityAr,
    required this.specialityEn,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? specialityKu;
  final String? specialityAr;
  final String? specialityEn;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json["_id"],
      specialityKu: json["speciality_ku"],
      specialityAr: json["speciality_ar"],
      specialityEn: json["speciality_en"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Image {
  Image({
    required this.bg,
    required this.md,
    required this.sm,
  });

  final String? bg;
  final String? md;
  final String? sm;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      bg: json["bg"],
      md: json["md"],
      sm: json["sm"],
    );
  }
}

class Office {
  Office({
    required this.id,
    required this.doctor,
    required this.title,
    required this.description,
    required this.daysOpen,
    required this.startTime,
    required this.endTime,
    required this.appointmentDuration,
    required this.appointmentTimeType,
    required this.fee,
    required this.typeOfCurrency,
    required this.phoneNumbers,
    required this.address,
    required this.isDeleted,
    required this.appointmentTimes,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final OfficeDoctor? doctor;
  final String? title;
  final String? description;
  final List<String> daysOpen;
  final String? startTime;
  final String? endTime;
  final int? appointmentDuration;
  final String? appointmentTimeType;
  final Fee? fee;
  final Currency? typeOfCurrency;
  final List<String> phoneNumbers;
  final Address? address;
  final bool? isDeleted;
  final AppointmentTimes? appointmentTimes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json["_id"],
      doctor:
          json["doctor"] == null ? null : OfficeDoctor.fromJson(json["doctor"]),
      title: json["title"],
      description: json["description"],
      daysOpen: json["daysOpen"] == null
          ? []
          : List<String>.from(json["daysOpen"]!.map((x) => x)),
      startTime: json["startTime"],
      endTime: json["endTime"],
      appointmentDuration: json["appointmentDuration"],
      appointmentTimeType: json["appointmentTimeType"],
      fee: json["fee"] == null ? null : Fee.fromJson(json["fee"]),
      typeOfCurrency: json["typeOfCurrency"] == null
          ? null
          : Currency.fromJson(json["typeOfCurrency"]),
      phoneNumbers: json["phoneNumbers"] == null
          ? []
          : List<String>.from(json["phoneNumbers"]!.map((x) => x)),
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? countryKu;
  final String? countryAr;
  final String? countryEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["_id"],
      countryKu: json["country_ku"],
      countryAr: json["country_ar"],
      countryEn: json["country_en"],
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? typeOfOfficeKu;
  final String? typeOfOfficeAr;
  final String? typeOfOfficeEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory TypeOfOffice.fromJson(Map<String, dynamic> json) {
    return TypeOfOffice(
      id: json["_id"],
      typeOfOfficeKu: json["typeOfOffice_ku"],
      typeOfOfficeAr: json["typeOfOffice_ar"],
      typeOfOfficeEn: json["typeOfOffice_en"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class AppointmentTimes {
  AppointmentTimes({
    required this.thursday,
    required this.friday,
    required this.wednesday,
  });

  final List<dynamic> thursday;
  final List<dynamic> friday;
  final List<dynamic> wednesday;

  factory AppointmentTimes.fromJson(Map<String, dynamic> json) {
    return AppointmentTimes(
      thursday: json["thursday"] == null
          ? []
          : List<dynamic>.from(json["thursday"]!.map((x) => x)),
      friday: json["friday"] == null
          ? []
          : List<dynamic>.from(json["friday"]!.map((x) => x)),
      wednesday: json["wednesday"] == null
          ? []
          : List<dynamic>.from(json["wednesday"]!.map((x) => x)),
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
    required this.profilePicture,
    required this.isThirdParty,
    required this.usePictureAsLink,
    required this.dateOfBirth,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.sessionToken,
    required this.level,
    required this.speciality,
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
  final String? profilePicture;
  final bool? isThirdParty;
  final bool? usePictureAsLink;
  final DateTime? dateOfBirth;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? sessionToken;
  final Level? level;
  final Speciality? speciality;

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
      profilePicture: json["profilePicture"],
      isThirdParty: json["isThirdParty"],
      usePictureAsLink: json["usePictureAsLink"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      sessionToken: json["sessionToken"],
      level: json["level"] == null ? null : Level.fromJson(json["level"]),
      speciality: json["speciality"] == null
          ? null
          : Speciality.fromJson(json["speciality"]),
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
