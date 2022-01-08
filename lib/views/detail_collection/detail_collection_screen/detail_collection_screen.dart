import 'package:flutter/material.dart';
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:pinterest/views/detail_collection/detail_collection_widgets/comment_collection_widget.dart';
import 'package:pinterest/views/detail_collection/detail_collection_widgets/detail_image_collection_widget.dart';
import 'package:pinterest/views/detail_collection/detail_collection_widgets/menu_pop_up_detail_collection_widget.dart';
import 'package:pinterest/views/home/home_widgets/bottom_navigation_widget.dart';
import 'package:pinterest/views/message/message_widgets/images_collection_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailCollectionScreen extends StatelessWidget {
  final PhotosOfCollectionModel imagesSelected;
  final int currentPage;
  final String id;
  final String idCollection;
  const DetailCollectionScreen(
      {Key? key,
      required this.imagesSelected,
      required this.currentPage,
      required this.idCollection,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhotosOfCollectionModel? image = imagesSelected ;

    double? heightDetail = 200;
    if (image.description == "") {
      heightDetail = 160;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: image.urls.regular,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black26,
                        ),
                        child: const Icon(
                          Icons.chevron_left_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: MenuPopUpDetailWidget(
                      urlImage: image.urls.full,
                      name: image.altDescription,
                    ),
                  ),
                ],
              ),
              DetailImageCollectionWidget(
                heightDetail: heightDetail,
                image: image,
              ),
              CommentCollectionWidget(image: image),
              SizedBox(
                  height: 1020,
                  child: ImagesCollectionWidget(
                    idCollection: idCollection,
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: Text("home"),
          child: const Icon(Icons.home),
          backgroundColor: Colors.grey[900],
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavigationWiget()));
          },
        ),
      ),
    );
  }
}
