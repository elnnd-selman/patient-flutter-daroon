import 'package:daroon_user/generated/assets.dart';

class DoctorSpecialtyModel {
  final String title;
  final String imageUrl;

  DoctorSpecialtyModel({required this.imageUrl, required this.title});
}

List<DoctorSpecialtyModel> doctorSpecialtyModel = [
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/generalIcon.svg", title: "General"),
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/psychiatristIcon.svg", title: "Psychiatrist"),
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/nutritionIcon.svg", title: "Nutrition.."),
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/dentistIcon.svg", title: "Dentist"),
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/pediatricIcon.svg", title: "Pediatric"),
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/radioloIcon.svg", title: "Radiolo"),
  DoctorSpecialtyModel(
      imageUrl: "assets/icons/ophthalIcon.svg", title: "Ophthal.."),
  DoctorSpecialtyModel(imageUrl: Assets.editIcon, title: "More"),
];
