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
