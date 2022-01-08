import 'package:flutter/material.dart';

import 'package:pinterest/models/result_unsplash_api.dart';
import 'package:pinterest/repositories/unsplash_repository.dart';
import 'package:pinterest/views/detail_pin/detail_widgets/comment_widget.dart';
import 'package:pinterest/views/detail_pin/detail_widgets/detail_image_widget.dart';
import 'package:pinterest/views/detail_pin/detail_widgets/menu_pop_up_detail_widget.dart';
import 'package:pinterest/views/home/home_widgets/bottom_navigation_widget.dart';
import 'package:pinterest/views/home/home_widgets/listview_home.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPinScreen extends StatelessWidget {
  final List<PhotoModel> imagesSelected;
  final int currentPage;
  final String query;
  final String id;
  const DetailPinScreen(
      {Key? key,
      required this.imagesSelected,
      required this.currentPage,
      required this.query,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String swipeDirection = '';
    PhotoModel image = imagesSelected.firstWhere((element) => element.id == id);
    List<PhotoModel>? listImageNew;
    int? indexOfImage;
    int? positionStarted;
    int? positionEnd;
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
                    onPanUpdate: (details) {
                      swipeDirection = details.delta.dx > 0 ? 'left' : 'right';
                    },
                    onPanEnd: (details) async {
                      if (swipeDirection == 'left') {
                        // handle swipe left to right
                        //Selected position ImageObject in list

                        await UnsplashRepositories.searchPhotos(
                          keyword: query,
                          page: currentPage,
                          perPage: 10,
                        ).then((value) {
                          listImageNew = value.results;
                        });
                        int indexxx = listImageNew!
                            .indexWhere((element) => element.id == id);

                        indexOfImage = indexxx;
                        if (indexOfImage == 0) {
                          indexOfImage = indexOfImage! + 1;
                          positionStarted = 0;
                          positionEnd = indexOfImage! + 2;
                        } else {
                          positionStarted = indexOfImage! - 1;
                          positionEnd = indexOfImage! + 2;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPinScreen(
                                      currentPage: currentPage,
                                      query: query,
                                      id: listImageNew![indexOfImage! - 1].id,
                                      imagesSelected: listImageNew!.sublist(
                                          positionStarted!, positionEnd),
                                    )));
                      }
                      if (swipeDirection == 'right') {
                        //handle swipe right to left
                        await UnsplashRepositories.searchPhotos(
                          keyword: query,
                          page: currentPage,
                          perPage: 10,
                        ).then((value) {
                          listImageNew = value.results;
                        });
                        int indexxx = listImageNew!
                            .indexWhere((element) => element.id == id);
                        int length = listImageNew!.length - 1;
                        indexOfImage = indexxx;

                        if (indexOfImage == 0) {
                          indexOfImage = 1;
                          positionStarted = 0;
                          positionEnd = 3;
                        } else if (indexOfImage == length) {
                          await UnsplashRepositories.searchPhotos(
                            keyword: query,
                            page: currentPage + 1,
                            perPage: 10,
                          ).then((value) {
                            listImageNew = value.results;
                          });

                          indexOfImage = -1;
                          positionStarted = 0;
                          positionEnd = 3;
                        } else {
                          positionStarted = indexOfImage! - 1;
                          positionEnd = indexOfImage! + 2;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPinScreen(
                                      currentPage: currentPage,
                                      query: query,
                                      id: listImageNew![indexOfImage! + 1].id,
                                      imagesSelected: listImageNew!.sublist(
                                          positionStarted!, positionEnd),
                                    )));
                      }
                    },
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
              DetailImageWidget(
                heightDetail: heightDetail,
                image: image,
              ),
              CommentWidget(image: image),
              SizedBox(
                  height: 1020,
                  child: ListViewImage(
                    page: currentPage,
                    query: query,
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
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
