import 'package:flutter/material.dart';
import 'package:pinterest/models/photos.dart';

class Details extends StatelessWidget {
  final PhotoPixabay? photoDetails;
  const Details({Key? key, required this.photoDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(35),
                  right: Radius.circular(35),
                ),
                child: Image.network(photoDetails!.webformatURL.toString())),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Text(
                'Image id: ${photoDetails!.id}',
                style: TextStyle(color: Colors.red[110]),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Text(
                'Image url: ${photoDetails!.webformatURL}',
                style: TextStyle(color: Colors.red[110]),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Text(
                'User: ${photoDetails!.user}',
                style: TextStyle(color: Colors.red[110]),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: Text(
                'Views: ${photoDetails!.views}',
                style: TextStyle(color: Colors.red[110]),
              )),
        ],
      ),
    );
  }
}
