import 'package:equatable/equatable.dart';

class CollectionModel extends Equatable {
  String id;
  String title;
  String description;
  String publishedAt;
  int totalPhotos;
  Urls coverPhoto;
  List<String> previewPhotos;
  UserUnsplash userUnsplash;
  CollectionModel({
    required this.id,
    required this.totalPhotos,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.coverPhoto,
    required this.previewPhotos,
    required this.userUnsplash,
  });
  @override
  List<Object?> get props => throw UnimplementedError();

  factory CollectionModel.none() {
    return CollectionModel(
      id: "",
      totalPhotos: 0,
      title: "",
      description: "",
      publishedAt: "",
      coverPhoto: Urls(
        full: "",
        raw: "",
        regular: "",
        thumb: "",
        small: "",
      ),
      previewPhotos: [],
      userUnsplash: UserUnsplash(
          id: "",
          firstName: "",
          lastName: "",
          name: "",
          location: "",
          portfolioUrl: "",
          profileImage: "",
          userName: "",
          twitterUserName: "",
          updatedAt: ""),
    );
  }
  factory CollectionModel.fromJson(json) {
    String _id = json['id'].toString();
    String _title = json['title'];
    String _description = json['description'] ?? "";
    String _publishedAt = json['published_at'];
    int _totalPhotos = json['total_photos'];
    var coverJson = json['cover_photo'];
    Urls coverPhoto =
        (coverJson['urls'] != null ? Urls.fromJson(coverJson['urls']) : null)!;

    List jsonImage = json['preview_photos'];
    List<String> _previewPhotos = [];
    for (var element in jsonImage) {
      var jsonImage = element["urls"];
      _previewPhotos.add(jsonImage["small"]);
    }
    UserUnsplash _userUnsplash =
        (json['user'] != null ? UserUnsplash.fromJson(json['user']) : null)!;
    return CollectionModel(
      id: _id,
      title: _title,
      description: _description,
      publishedAt: _publishedAt,
      coverPhoto: coverPhoto,
      totalPhotos: _totalPhotos,
      previewPhotos: _previewPhotos,
      userUnsplash: _userUnsplash,
    );
  }
}

////=======================================================================
class PhotosOfCollectionModel extends Equatable {
  String id;
  String createdAt;
  String updatedAt;
  int width;
  int height;
  String color;
  String description;
  String altDescription;
  int like;
  Urls urls;
  UserUnsplash userUnsplash;
  PhotosOfCollectionModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.description,
    required this.altDescription,
    required this.like,
    required this.urls,
    required this.userUnsplash,
  });

  factory PhotosOfCollectionModel.fromJson(Map<String, dynamic> json) {
    String _id = json['id'];
    String _createdAt = json['created_at'];
    String _updatedAt = json['updated_at'];
    int _width = json['width'];
    int _height = json['height'];
    String _color = json['color'];
    String _description = json['description'] ?? "";
    String _altDescription = json['alt_description'] ?? "";
    int _like = json['likes'] as int;
    Urls _urls = (json['urls'] != null ? Urls.fromJson(json['urls']) : null)!;
    UserUnsplash _userUnsplash =
        (json['user'] != null ? UserUnsplash.fromJson(json['user']) : null)!;
    return PhotosOfCollectionModel(
        id: _id,
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        width: _width,
        height: _height,
        color: _color,
        description: _description,
        altDescription: _altDescription,
        like: _like,
        urls: _urls,
        userUnsplash: _userUnsplash);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['width'] = width;
    data['height'] = height;
    data['color'] = color;
    data['description'] = description;
    data['alt_description'] = altDescription;
    data['urls'] = urls.toJson();
    return data;
  }

  @override
  List<Object?> get props => [id, altDescription, description, urls, color];
}

class Urls extends Equatable {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb});

  factory Urls.fromJson(Map<String, dynamic> json) {
    String _raw = json['raw'];
    String _full = json['full'];
    String _regular = json['regular'];
    String _small = json['small'];
    String _thumb = json['thumb'];
    return Urls(
      raw: _raw,
      full: _full,
      regular: _regular,
      small: _small,
      thumb: _thumb,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['raw'] = raw;
    data['full'] = full;
    data['regular'] = regular;
    data['small'] = small;
    data['thumb'] = thumb;
    return data;
  }

  @override
  List<Object?> get props => [raw, full, regular, small, thumb];
}

class UserUnsplash extends Equatable {
  String id;
  String updatedAt;
  String userName;
  String name;
  String firstName;
  String lastName;
  String twitterUserName;
  String portfolioUrl;
  String location;
  String profileImage;
  UserUnsplash({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.location,
    required this.portfolioUrl,
    required this.profileImage,
    required this.userName,
    required this.twitterUserName,
    required this.updatedAt,
  });
  factory UserUnsplash.fromJson(Map<String, dynamic> json) {
    String id = json['id'];
    String firstName = json['first_name'] ?? "";
    String lastName = json['last_name'] ?? "";
    String name = json['name'];
    String userName = json['username'];
    String location = json['location'] ?? "";
    String portfolioUrl = json['portfolio_url'] ?? "";
    String twitterUserName = json['twitter_username'] ?? "";
    String updatedAt = json['updated_at'];
    var imageProfile = json['profile_image'];

    String profileImage = imageProfile["large"];
    return UserUnsplash(
        id: id,
        firstName: firstName,
        lastName: lastName,
        name: name,
        location: location,
        portfolioUrl: portfolioUrl,
        userName: userName,
        twitterUserName: twitterUserName,
        updatedAt: updatedAt,
        profileImage: profileImage);
  }

  Map<String, dynamic> toJson(UserUnsplash user) {
    final Map<String, dynamic> data = {};
    data['fistName'] = user.firstName;
    data['lastName'] = user.lastName;
    data['name'] = user.name;
    return data;
  }

  @override
  List<Object?> get props => [id, userName];
}
