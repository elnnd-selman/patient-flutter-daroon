class PublicAdsModel {
  PublicAdsModel({
    required this.id,
    required this.image,
    required this.titleEn,
    required this.titleAr,
    required this.titleKu,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.startTime,
    required this.attachment,
    required this.buttonAvailable,
    required this.endTime,
    required this.descriptionKu,
    required this.referralLink,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.audienceRole,
  });

  final String? id;
  final Attachment? image;
  final String? titleEn;
  final String? titleAr;
  final String? titleKu;
  final String? descriptionEn;
  final String? descriptionAr;
  final DateTime? startTime;
  final Attachment? attachment;
  final bool? buttonAvailable;
  final DateTime? endTime;
  final String? descriptionKu;
  final String? referralLink;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? audienceRole;

  factory PublicAdsModel.fromJson(Map<String, dynamic> json) {
    return PublicAdsModel(
      id: json["_id"],
      image: json["image"] == null ? null : Attachment.fromJson(json["image"]),
      titleEn: json["title_en"],
      titleAr: json["title_ar"],
      titleKu: json["title_ku"],
      descriptionEn: json["description_en"],
      descriptionAr: json["description_ar"],
      startTime: DateTime.tryParse(json["start_time"] ?? ""),
      attachment: json["attachment"] == null
          ? null
          : Attachment.fromJson(json["attachment"]),
      buttonAvailable: json["button_available"],
      endTime: DateTime.tryParse(json["end_time"] ?? ""),
      descriptionKu: json["description_ku"],
      referralLink: json["referral_link"],
      isActive: json["is_active"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      audienceRole: json["audience_role"],
    );
  }
}

class Attachment {
  Attachment({
    required this.bg,
    required this.md,
    required this.sm,
  });

  final String? bg;
  final String? md;
  final String? sm;

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      bg: json["bg"],
      md: json["md"],
      sm: json["sm"],
    );
  }
}
