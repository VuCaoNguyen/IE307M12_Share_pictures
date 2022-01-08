import 'package:equatable/equatable.dart';

class TopicModel extends Equatable {
  String id;
  String slug;
  String title;
  String description;
  String publishedAt;
  List<String> urlImage;
  TopicModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.urlImage,
  });
  @override
  List<Object?> get props => throw UnimplementedError();

  factory TopicModel.fromJson(json) {
    String _id = json['id'].toString();
    String _slug = json['slug'];
    String _title = json['title'];
    String _description = json['description'];
    String _publishedAt = json['published_at'];
    List jsonImage = json['preview_photos'];
    List<String> urlImage = [];
    for (var element in jsonImage) {
      var jsonImage = element["urls"];
      urlImage.add(jsonImage["small"]);
    }

    return TopicModel(
        id: _id,
        slug: _slug,
        title: _title,
        description: _description,
        publishedAt: _publishedAt,
        urlImage: urlImage);
  }
}
