import 'package:flutter/material.dart';
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ListImageCollectionBuilder extends StatelessWidget {
  const ListImageCollectionBuilder({
    Key? key,
    required this.collections,
    required this.datetime,
  }) : super(key: key);

  final CollectionModel collections;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collections.title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    datetime,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(3),
                  height: 23,
                  color: Colors.orange,
                  child: Text(
                    " ${collections.totalPhotos} Pictures",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: collections.previewPhotos[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 2),
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: collections.previewPhotos[1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 2),
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: collections.previewPhotos[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
