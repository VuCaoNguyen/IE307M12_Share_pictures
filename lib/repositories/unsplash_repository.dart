import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:pinterest/models/result_unsplash_api.dart';
import 'package:pinterest/models/topic_unsplash_model.dart';

class UnsplashRepositories {
  static String api = "nEfzLF1QiFIx_0fXI5sYEhjIadU1rZ2vJSbTj6G1WBQ";
  static Future<Data> searchPhotos({keyword, page, perPage}) async {
    // var url = Uri.https(
    //   'unsplash.com',
    //   '/napi/search/photos',
    //   {'query': '$keyword', 'xp': '', 'per_page': '$perPage', 'page': '$page'},
    // );
    var url = Uri.https(
      'api.unsplash.com',
      '/search/photos',
      {
        'query': '$keyword',
        'xp': '',
        'per_page': '$perPage',
        'page': '$page',
        "client_id": api,
      },
    );
    print("Search $keyword--- $page ----- $perPage");
    var responseApi = await http.get(url);
    if (responseApi.statusCode == 200) {
      var resJSON = json.decode(responseApi.body);
      var data = Data.fromJson(resJSON);
      return data;
    } else {
      return Data(total: 0, totalPages: 0, results: const []);
    }
  }

  static Future<List<CollectionModel>> fetchCollections({page, perPage}) async {
    var url = Uri.https(
      'api.unsplash.com',
      '/collections',
      {
        'per_page': '$perPage',
        'page': '$page',
        "client_id": api,
      },
    );

    var responseApi = await http.get(url);
    if (responseApi.statusCode == 200) {
      List resJSON = json.decode(responseApi.body);
      List<CollectionModel> data = [];
      for (var element in resJSON) {
        data.add(CollectionModel.fromJson(element));
      }

      return data;
    } else {
      return [];
    }
  }

  static Future<List<PhotosOfCollectionModel>> fetchPhotoOfCollections(
      {page, perPage, id}) async {
    var url = Uri.https(
      'api.unsplash.com',
      '/collections/$id/photos',
      {
        'per_page': '$perPage',
        'page': '$page',
        "client_id": api,
      },
    );

    var responseApi = await http.get(url);
    if (responseApi.statusCode == 200) {
      List resJSON = json.decode(responseApi.body);
      List<PhotosOfCollectionModel> data = [];
      for (var element in resJSON) {
        data.add(PhotosOfCollectionModel.fromJson(element));
      }

      return data;
    } else {
      return [];
    }
  }

  static Future<List<TopicModel>> fetchTopics({page, perPage, orderBy}) async {
    var url = Uri.https(
      'api.unsplash.com',
      '/topics',
      {
        'per_page': '$perPage',
        'page': '$page',
        'order_by': '$orderBy',
        "client_id": api,
      },
    );

    var responseApi = await http.get(
      url,
    );
    if (responseApi.statusCode == 200) {
      var resJSON = json.decode(responseApi.body) as List;
      List<TopicModel> topics = [];
      for (var element in resJSON) {
        topics.add(TopicModel.fromJson(element));
      }
      return topics;
    } else {
      return [];
    }
  }
}
