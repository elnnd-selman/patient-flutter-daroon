class CancelAppointmentModel {
  final String title;

  CancelAppointmentModel({required this.title});
}

List<CancelAppointmentModel> cancelAppointmentList = [
  CancelAppointmentModel(title: "Weather condition"),
  CancelAppointmentModel(title: "Unexpected word"),
  CancelAppointmentModel(title: "Childcare issue"),
  CancelAppointmentModel(title: "Travel delays"),
  CancelAppointmentModel(title: "Other"),
];
