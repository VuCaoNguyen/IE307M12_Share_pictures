import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pinterest/models/photos.dart';

class ApiProvider {
  Future<List<PhotoPixabay>> fetchPhotos(http.Client client) async {
    Uri _url = Uri.https('pixabay.com', '/api', {
      "key": "21224893-c61153f1d9b5a52314e204800",
      'q': 'girl',
      'page': "2",
      'per_page': '200',
      "lang": "ja"
    });

    http.Response response = await client.get(_url);
    return parsePhotos(response.body);
  }

  List<PhotoPixabay> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody);

    return parsed['hits']
        .map<PhotoPixabay>((json) => PhotoPixabay.fromJson(json))
        .toList();
  }
}
