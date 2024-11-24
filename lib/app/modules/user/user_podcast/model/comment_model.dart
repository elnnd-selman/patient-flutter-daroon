class CommetModel {
  CommetModel({
    required this.data,
    required this.success,
    required this.status,
  });

  final List<CommentReplyModel> data;
  final bool? success;
  final int? status;

  factory CommetModel.fromJson(Map<String, dynamic> json) {
    return CommetModel(
      data: json["data"] == null
          ? []
          : List<CommentReplyModel>.from(
              json["data"]!.map((x) => CommentReplyModel.fromJson(x))),
      success: json["success"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
        "success": success,
        "status": status,
      };
}

class CommentReplyModel {
  CommentReplyModel({
    required this.id,
    required this.user,
    required this.content,
    required this.comment,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.likes,
    required this.replies,
  });

  final String? id;
  final User? user;
  final String? content;
  final String? comment;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? likes;
  final List<ReplyModel> replies;

  factory CommentReplyModel.fromJson(Map<String, dynamic> json) {
    return CommentReplyModel(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      content: json["content"],
      comment: json["comment"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      likes: json["likes"],
      replies: json["replies"] == null
          ? []
          : List<ReplyModel>.from(
              json["replies"]!.map((x) => ReplyModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "content": content,
        "comment": comment,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "likes": likes,
        // "replies": replies.map((x) => x?.toJson()).toList(),
      };
}

class ReplyModel {
  ReplyModel({
    required this.id,
    required this.user,
    required this.content,
    required this.parentComment,
    required this.comment,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.likes,
  });

  final String? id;
  final User? user;
  final String? content;
  final String? parentComment;
  final String? comment;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? likes;

  factory ReplyModel.fromJson(Map<String, dynamic> json) {
    return ReplyModel(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      content: json["content"],
      parentComment: json["parentComment"],
      comment: json["comment"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      likes: json["likes"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "content": content,
        "parentComment": parentComment,
        "comment": comment,
        "isDeleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "likes": likes,
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.username,
    required this.lastNameKu,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.usePictureAsLink,
    required this.profilePicture,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final String? username;
  final String? lastNameKu;
  final String? lastNameAr;
  final String? lastNameEn;
  final bool? usePictureAsLink;
  final ProfilePicture? profilePicture;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      username: json["username"],
      lastNameKu: json["lastName_ku"],
      lastNameAr: json["lastName_ar"],
      lastNameEn: json["lastName_en"],
      usePictureAsLink: json["usePictureAsLink"],
      profilePicture: json["profilePicture"] == null
          ? null
          : ProfilePicture.fromJson(json["profilePicture"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "firstName_ku": firstNameKu,
        "firstName_en": firstNameEn,
        "firstName_ar": firstNameAr,
        "username": username,
        "lastName_ku": lastNameKu,
        "lastName_ar": lastNameAr,
        "lastName_en": lastNameEn,
        "usePictureAsLink": usePictureAsLink,
        "profilePicture": profilePicture?.toJson(),
      };
}

class ProfilePicture {
  ProfilePicture({
    required this.bg,
    required this.md,
    required this.sm,
  });

  final String? bg;
  final String? md;
  final String? sm;

  factory ProfilePicture.fromJson(Map<String, dynamic> json) {
    return ProfilePicture(
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
