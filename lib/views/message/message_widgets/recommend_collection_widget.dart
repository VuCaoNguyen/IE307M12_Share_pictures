import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pinterest/models/collections_unsplash_model.dart';
import 'package:pinterest/repositories/unsplash_repository.dart';
import 'package:pinterest/views/message/message_widgets/images_collection_widget.dart';
import 'package:pinterest/views/message/message_widgets/list_image_collection_widget.dart';

class RecommendCollectionWidgetGridView extends StatelessWidget {
  RecommendCollectionWidgetGridView(
      {Key? key, required this.page, required this.perPage, this.onPresss})
      : super(key: key);
  final int page;
  final int perPage;
  VoidCallback? onPresss;
  @override
  Widget build(BuildContext context) {
    List<CollectionModel> collections = [];
    final _controller = ScrollController();

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: perPage * 250,
          child: FutureBuilder(
            future: UnsplashRepositories.fetchCollections(
                page: page, perPage: perPage),
            builder: (context, snap) {
              if (snap.hasError) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (!snap.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                collections = snap.data as List<CollectionModel>;
                return ListView.builder(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    String datetime = DateFormat.yMMMMEEEEd().format(
                        DateTime.parse(
                            collections[index].publishedAt.toString()));
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImagesCollectionWidget(
                                  idCollection: collections[index].id,
                                )));
                      },
                      child: ListImageCollectionBuilder(
                          collections: collections[index], datetime: datetime),
                    );
                  },
                  itemCount: collections.length,
                );
              }
            },
          ),
        ),
        ElevatedButton(
          onPressed: onPresss,
          child: Text("More collections"),
          style: ButtonStyle(backgroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.orange;
            }
            return Colors.black; // Use the component's default.
          }), shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20));
          }), side: MaterialStateProperty.resolveWith<BorderSide>((_) {
            return BorderSide(width: 1, color: Colors.white);
          })),
        ),
        SizedBox(
          height: 300,
        )
      ],
    );
  }
}
