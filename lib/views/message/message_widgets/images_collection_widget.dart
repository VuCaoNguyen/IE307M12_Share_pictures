import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:pinterest/repositories/unsplash_repository.dart';
import 'package:pinterest/views/detail_collection/detail_collection_screen/detail_collection_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesCollectionWidget extends StatefulWidget {
  ImagesCollectionWidget(
      {Key? key, required this.idCollection, this.focus = false})
      : super(key: key);
  final String idCollection;
  bool focus;
  @override
  _ListImageRecommendState createState() => _ListImageRecommendState();
}

class _ListImageRecommendState extends State<ImagesCollectionWidget> {
  TextEditingController searchController = TextEditingController();
  String? id;
  @override
  void initState() {
    super.initState();
    searchController.text = widget.idCollection;
  }

  @override
  Widget build(BuildContext context) {
    id = widget.idCollection;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              key: Key(searchController.text),
              child: ListViewImagesCollection(
                page: 1,
                idCollection: widget.idCollection,
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            backgroundColor: Colors.black87,
            child: Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ));
  }
}

// ignore: must_be_immutable
class ListViewImagesCollection extends StatefulWidget {
  const ListViewImagesCollection({
    Key? key,
    required this.idCollection,
    required this.page,
  }) : super(key: key);

  final String idCollection;

  final int page;
  @override
  State<ListViewImagesCollection> createState() =>
      _ListViewImagesCollectionState();
}

class _ListViewImagesCollectionState extends State<ListViewImagesCollection> {
  //To dectect top or bottom of list and rebuilt fetchData search next page
  final _controller = ScrollController();

  List<PhotosOfCollectionModel> _resaults = [];
  late int _page;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _page = widget.page;
    // Api take list images by topic
    UnsplashRepositories.fetchPhotoOfCollections(
      id: widget.idCollection,
      page: widget.page,
      perPage: 10,
    ).then((value) {
      setState(() {
        _resaults = value;
      });
    });

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        // Fetch data when scroll on bottom
        if (isTop) {
        } else {
          setState(() {
            _page = _page + 1;
          });
          UnsplashRepositories.fetchPhotoOfCollections(
            id: widget.idCollection,
            page: _page,
            perPage: 10,
          ).then((value) {
            _resaults.addAll(value);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UnsplashRepositories.fetchPhotoOfCollections(
        id: widget.idCollection,
        page: _page,
        perPage: 10,
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          ));
        } else if (snapshot.hasError) {
          return Container(
            color: Colors.black,
            child: Text("Error"),
          );
        } else {
          return StaggeredGridView.countBuilder(
            controller: _controller,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemCount: _resaults.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Selected position ImageObject in list

                  int currentPageSelected = index ~/ 10 + 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailCollectionScreen(
                        idCollection: widget.idCollection,
                        id: _resaults[index].id,
                        currentPage: currentPageSelected,
                        imagesSelected: _resaults[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: _resaults[index].urls.regular,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            },
          );
        }
      },
    );
  }
}
