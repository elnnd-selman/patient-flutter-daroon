class SpecialityModel {
  SpecialityModel({
    required this.id,
    required this.specialityKu,
    required this.specialityAr,
    required this.specialityEn,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.image,
    required this.isDeleted,
    required this.specialityType,
  });

  final String? id;
  final String? specialityKu;
  final String? specialityAr;
  final String? specialityEn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Image? image;
  final bool? isDeleted;
  final String? specialityType;

  factory SpecialityModel.fromJson(Map<String, dynamic> json) {
    return SpecialityModel(
      id: json["_id"],
      specialityKu: json["speciality_ku"],
      specialityAr: json["speciality_ar"],
      specialityEn: json["speciality_en"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      isDeleted: json["isDeleted"],
      specialityType: json["speciality_type"],
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
