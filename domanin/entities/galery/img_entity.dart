class ImgEntity {
  final int id;
  final String img;
  final int viewed;
  final int liked;
  final bool isEmpty;
  ImgEntity({
    required this.id,
    this.img = "",
    this.viewed = 0,
    this.liked = 0,
    this.isEmpty = true,
  });

  static ImgEntity empty() => ImgEntity(id: 0);

}
