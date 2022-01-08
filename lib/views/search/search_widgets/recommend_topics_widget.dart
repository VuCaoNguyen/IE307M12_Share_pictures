import 'package:flutter/material.dart';
import 'package:pinterest/models/topic_unsplash_model.dart';
import 'package:pinterest/repositories/unsplash_repository.dart';
import 'package:pinterest/views/search/search_widgets/images_recommend_widget.dart';

class RecommendTopicsGridViewWidget extends StatelessWidget {
  const RecommendTopicsGridViewWidget({
    Key? key,
    required this.page,
    required this.perPage,
  }) : super(key: key);
  final int page;
  final int perPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: perPage * 60,
      child: FutureBuilder(
        future: UnsplashRepositories.fetchTopics(
          page: page,
          perPage: perPage,
          orderBy: "oldest",
        ),
        builder: (context, snap) {
          if (snap.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (!snap.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<TopicModel> topics = snap.data as List<TopicModel>;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 4 / 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
              ),
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ImagesRecommendTopicWidget(
                              query: topics[index].title,
                            )));
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.8),
                                  BlendMode.dstATop),
                              image: NetworkImage(
                                topics[index].urlImage[0],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Text(
                        topics[index].title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              itemCount: topics.length,
            );
          }
        },
      ),
    );
  }
}
