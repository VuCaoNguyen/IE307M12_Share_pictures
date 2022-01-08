import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/views/detail_pin/detail_screen/detail_pin_screen.dart';
import 'package:pinterest/models/result_unsplash_api.dart';
import 'package:pinterest/repositories/unsplash_repository.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class ListViewImage extends StatefulWidget {
  const ListViewImage({
    Key? key,
    required this.query,
    
    required this.page,
  }) : super(key: key);

  final String query;
  
  final int page;
  @override
  State<ListViewImage> createState() => _ListViewImageState();
}

class _ListViewImageState extends State<ListViewImage> {
  //To dectect top or bottom of list and rebuilt fetchData search next page
  final _controller = ScrollController();

  List<PhotoModel> _resaults = [];
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
    UnsplashRepositories.searchPhotos(
      keyword: widget.query,
      page: widget.page,
      perPage: 10,
    ).then((value) {
      setState(() {
        _resaults = value.results;
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
          UnsplashRepositories.searchPhotos(
            keyword: widget.query,
            page: _page,
            perPage: 10,
          ).then((value) {
            _resaults.addAll(value.results);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UnsplashRepositories.searchPhotos(
        keyword: widget.query,
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
                  //Selected position ImageObject in list
                  int positionStarted;
                  int positionEnd;
                  if (index == 0) {
                    positionStarted = 0;
                    positionEnd = index + 2;
                  } else {
                    positionStarted = index - 1;
                    positionEnd = index + 2;
                  }
                  int currentPageSelected = index ~/ 10 + 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPinScreen(
                        id: _resaults[index].id,
                        currentPage: currentPageSelected,
                        imagesSelected:
                            _resaults.sublist(positionStarted, positionEnd),
                        query: widget.query,
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
