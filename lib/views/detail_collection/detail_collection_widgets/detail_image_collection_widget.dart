import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailImageCollectionWidget extends StatelessWidget {
  const DetailImageCollectionWidget({
    Key? key,
    required this.heightDetail,
    required this.image,
  }) : super(key: key);

  final double? heightDetail;
  final PhotosOfCollectionModel image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightDetail,
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: image.userUnsplash.profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  image.userUnsplash.name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return Colors.grey[700];
                    }),
                  ),
                  onPressed: () {},
                  child: Text("Follow"),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 15, top: 5),
              child: Text(
                image.altDescription,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 15, top: 5),
                child: Text(
                  image.description,
                  style: TextStyle(color: Colors.white),
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) {
                            return Colors.grey[700];
                          }),
                        ),
                        onPressed: () {},
                        child: Text("View"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) {
                            return Colors.redAccent[700];
                          }),
                        ),
                        onPressed: () {},
                        child: Text("Save"),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share_sharp, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
