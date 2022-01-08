class PhotoPixabay {
  final int id;
  final String webformatURL;
  final String? user;
  final int? views;
  final int? imageWidth;
  final int? imageHeight;

  const PhotoPixabay({
    this.user,
    this.views,
    this.imageWidth,
    this.imageHeight,
    required this.id,
    required this.webformatURL,
  });

  factory PhotoPixabay.fromJson(Map<String, dynamic> json) {
    return PhotoPixabay(
        id: json['id'],
        webformatURL: json['webformatURL'],
        user: json['user'],
        views: json['views'],
        imageWidth: json['imageWidth'] as int,
        imageHeight: json['imageHeight'] as int);
  }
}
