class OfficialProfileEntity {
  final List<String>? images;
  final String? avatarImg;
  final String name;
  final List<String> locations;
  final String about;
  final int followers;
  final int followUps;
  final int likeCount;
  final int videos;
  final int pictures;
  final int comments;
  final int coin;
  final bool isEmpty;

  OfficialProfileEntity({
    required this.name,
    required this.locations,
    this.avatarImg,
    required this.about,
     this.images,
    required this.followers,
    required this.followUps,
    required this.likeCount,
    required this.videos,
    required this.pictures,
    required this.comments,
    required this.coin,
    this.isEmpty = true,
  });

  static OfficialProfileEntity empty() => OfficialProfileEntity(
        coin: 0,
        images: [],
        name: '*Arzan TM*',
        followers: 0,
        followUps: 0,
        likeCount: 0,
        videos: 0,
        pictures: 0,
        comments: 0,
        locations: [],
        about: '',
      );

  factory OfficialProfileEntity.frowJson(Map<String, dynamic> json) =>
      OfficialProfileEntity(
        images: json["coin"],
        avatarImg: json["avatarImg"],
        name: json["name"],
        locations: json["locations"],
        about: json["about"],
        followers: json["followers"],
        followUps: json["followUps"],
        likeCount: json["likeCount"],
        videos: json["videos"],
        pictures: json["pictures"],
        comments: json["comments"],
        coin: json["coin"],
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "images": images,
        "avatarImg": avatarImg,
        "name": name,
        "locations": locations,
        "about": about,
        "followers": followers,
        "followUps": followUps,
        "likeCount": likeCount,
        "videos": videos,
        "pictures": pictures,
        "comments": comments,
        "coin": coin,
        "isEmpty": isEmpty,
      };
}
