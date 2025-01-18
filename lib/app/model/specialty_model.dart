class Speciality {
  Speciality({
    required this.id,
    required this.image,
    required this.specialityKu,
    required this.specialityAr,
    required this.specialityEn,
    required this.specialityType,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final Image? image;
  final String? specialityKu;
  final String? specialityAr;
  final String? specialityEn;
  final String? specialityType;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json["_id"],
      image: json["image"] == null || json["image"].runtimeType == String
          ? null
          : Image.fromJson(json["image"]),
      specialityKu: json["speciality_ku"],
      specialityAr: json["speciality_ar"],
      specialityEn: json["speciality_en"],
      specialityType: json["speciality_type"],
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
