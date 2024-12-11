class VideoCallModel {
  VideoCallModel({
    required this.token,
    required this.id,
    required this.name,
    required this.customParticipantId,
    required this.presetId,
    required this.sipEnabled,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? token;
  final String? id;
  final String? name;
  final String? customParticipantId;
  final String? presetId;
  final bool? sipEnabled;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory VideoCallModel.fromJson(Map<String, dynamic> json) {
    return VideoCallModel(
      token: json["token"],
      id: json["id"],
      name: json["name"],
      customParticipantId: json["custom_participant_id"],
      presetId: json["preset_id"],
      sipEnabled: json["sip_enabled"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
