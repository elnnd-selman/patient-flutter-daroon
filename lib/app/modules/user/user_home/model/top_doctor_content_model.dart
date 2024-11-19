class ContentData {
  ContentData({
    required this.id,
    required this.user,
    required this.titleKu,
    required this.titleEn,
    required this.titleAr,
    required this.contentKu,
    required this.contentAr,
    required this.contentEn,
    required this.images,
    required this.videos,
    required this.isPrivate,
    required this.contentType,
    required this.isLiked,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.likes,
    required this.type,
    required this.imageVideoUrl,
    required this.commentCount,
  });

  final String? id;
  final User? user;
  final String? titleKu;
  final String? titleEn;
  final String? titleAr;
  final List<ImageVideoUrl> imageVideoUrl;
  final String? contentKu;
  final String? contentAr;
  final String? contentEn;
  final List<String> images;
  final List<dynamic> videos;
  final bool? isPrivate;

  final String? contentType;
  bool? isLiked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  int? v;
  int? likes;
  final String? type;
  final int commentCount;

  factory ContentData.fromJson(Map<String, dynamic> json) {
    return ContentData(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      titleKu: json["title_ku"],
      titleEn: json["title_en"],
      titleAr: json["title_ar"],
      contentKu: json["content_ku"],
      contentAr: json["content_ar"],
      contentEn: json["content_en"],
      commentCount: json["commentCount"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      videos: json["videos"] == null
          ? []
          : List<dynamic>.from(json["videos"]!.map((x) => x)),
      isPrivate: json["isPrivate"],
      // sizeOfContents: json["sizeOfContents"],
      contentType: json["contentType"],
      isLiked: json["isLiked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      likes: json["likes"],
      type: json["type"],
      imageVideoUrl: getImageAndVideoUrl(
        json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        json["videos"] == null
            ? []
            : List<String>.from(json["videos"]!.map((x) => x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "title_ku": titleKu,
        "title_en": titleEn,
        "title_ar": titleAr,
        "content_ku": contentKu,
        "content_ar": contentAr,
        "content_en": contentEn,
        "images": images.map((x) => x).toList(),
        "videos": videos.map((x) => x).toList(),
        "isPrivate": isPrivate,
        // "sizeOfContents": sizeOfContents,
        "contentType": contentType,
        "isLiked": isLiked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "likes": likes,
        "type": type,
      };

  static List<ImageVideoUrl> getImageAndVideoUrl(
      List<String> imageUrl, List<String> videoUrl) {
    List<ImageVideoUrl> imageVideoUrlList = [];

    if (imageUrl.isNotEmpty) {
      for (int i = 0; i < imageUrl.length; i++) {
        imageVideoUrlList
            .add(ImageVideoUrl(url: imageUrl[i], urlType: "imageUrl"));
      }
    }
    if (videoUrl.isNotEmpty) {
      for (int i = 0; i < videoUrl.length; i++) {
        imageVideoUrlList
            .add(ImageVideoUrl(url: videoUrl[i], urlType: "videoUrl"));
      }
    }
    return imageVideoUrlList;
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.firstNameKu,
    required this.firstNameEn,
    required this.firstNameAr,
    required this.profilePicture,
    required this.usePictureAsLink,
  });

  final String? id;
  final String? firstName;
  final String? firstNameKu;
  final String? firstNameEn;
  final String? firstNameAr;
  final dynamic profilePicture;
  final bool? usePictureAsLink;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstName: json["firstName"],
      firstNameKu: json["firstName_ku"],
      firstNameEn: json["firstName_en"],
      firstNameAr: json["firstName_ar"],
      profilePicture: json["profilePicture"],
      usePictureAsLink: json["usePictureAsLink"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "firstName_ku": firstNameKu,
        "firstName_en": firstNameEn,
        "firstName_ar": firstNameAr,
        "profilePicture": profilePicture,
        "usePictureAsLink": usePictureAsLink,
      };
}

class ImageVideoUrl {
  final String? url;
  final String? urlType;

  ImageVideoUrl({required this.url, required this.urlType});
}
