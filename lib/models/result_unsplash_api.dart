import 'package:equatable/equatable.dart';

class Data extends Equatable {
  int total;
  int totalPages;
  List<PhotoModel> results;

  Data({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<PhotoModel> _results = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        _results.add(PhotoModel.fromJson(v));
      });
    }
    return Data(
      total: json['total'],
      totalPages: json['total_pages'],
      results: _results,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_pages'] = totalPages;
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [total, totalPages, results];
}

class PhotoModel extends Equatable {
  String id;
  String createdAt;
  String updatedAt;
  int width;
  int height;
  String color;
  String description;
  String altDescription;
  Urls urls;
  UserUnsplash userUnsplash;
  PhotoModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.description,
    required this.altDescription,
    required this.urls,
    required this.userUnsplash,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    String _id = json['id'];
    String _createdAt = json['created_at'];
    String _updatedAt = json['updated_at'];
    int _width = json['width'];
    int _height = json['height'];
    String _color = json['color'];
    String _description = json['description'] ?? "";
    String _altDescription = json['alt_description'] ?? "";
    Urls _urls = (json['urls'] != null ? Urls.fromJson(json['urls']) : null)!;
    UserUnsplash _userUnsplash =
        (json['user'] != null ? UserUnsplash.fromJson(json['user']) : null)!;
    return PhotoModel(
        id: _id,
        createdAt: _createdAt,
        updatedAt: _updatedAt,
        width: _width,
        height: _height,
        color: _color,
        description: _description,
        altDescription: _altDescription,
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
