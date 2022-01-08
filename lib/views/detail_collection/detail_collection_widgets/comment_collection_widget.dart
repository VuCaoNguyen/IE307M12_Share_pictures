import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:transparent_image/transparent_image.dart';

class CommentCollectionWidget extends StatefulWidget {
  const CommentCollectionWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final PhotosOfCollectionModel image;

  @override
  State<CommentCollectionWidget> createState() =>
      _CommentCollectionWidgetState();
}

class _CommentCollectionWidgetState extends State<CommentCollectionWidget> {
  Future<dynamic> showSheetComment(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 400,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0))),
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Add comment",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    TextField(
                      maxLines: 2,
                      autofocus: true,
                      cursorColor: Colors.white70,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: ""),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      // width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.only(left: 15, top: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[900],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                "Comments",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Love this picture? ',
                children: <TextSpan>[
                  TextSpan(
                      text: widget.image.userUnsplash.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' know!'),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showSheetComment(context);
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.image.userUnsplash.profileImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add a comment",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
