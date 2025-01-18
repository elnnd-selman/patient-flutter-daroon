import 'package:hive/hive.dart';
part 'user_profile_picture.g.dart';

@HiveType(typeId: 5)
class UserProfilePicture {
  UserProfilePicture({
    required this.bg,
    required this.md,
    required this.sm,
  });
  @HiveField(0)
  final String? bg;
  @HiveField(1)
  final String? md;
  @HiveField(2)
  final String? sm;

  factory UserProfilePicture.fromJson(Map<String, dynamic> json) {
    return UserProfilePicture(
      bg: json["bg"],
      md: json["md"],
      sm: json["sm"],
    );
  }
  Map<String, dynamic> toJson() => {
        "bg": bg,
        "md": md,
        "sm": sm,
      };
}
