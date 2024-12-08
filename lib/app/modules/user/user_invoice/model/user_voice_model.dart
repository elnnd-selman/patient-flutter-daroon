class UserVoiceModel {
  UserVoiceModel({
    required this.id,
    required this.user,
    required this.appointment,
    required this.currency,
    required this.totalAmount,
    required this.originalTotal,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.invoiceNumber,
    required this.v,
  });

  final String? id;
  final String? user;
  final Appointment? appointment;
  final String? currency;
  final int? totalAmount;
  final int? originalTotal;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? invoiceNumber;
  final int? v;

  factory UserVoiceModel.fromJson(Map<String, dynamic> json) {
    return UserVoiceModel(
      id: json["_id"],
      user: json["user"],
      appointment: json["appointment"] == null
          ? null
          : Appointment.fromJson(json["appointment"]),
      currency: json["currency"],
      totalAmount: json["totalAmount"],
      originalTotal: json["originalTotal"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      invoiceNumber: json["invoiceNumber"],
      v: json["__v"],
    );
  }
}

class Appointment {
  Appointment({
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
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? office;
  final String? doctor;
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
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json["_id"],
      office: json["office"],
      doctor: json["doctor"],
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
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
