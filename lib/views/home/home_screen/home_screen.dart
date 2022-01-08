import 'package:flutter/material.dart';
import 'package:pinterest/models/topic_unsplash_model.dart';
import 'package:pinterest/repositories/unsplash_repository.dart';
import 'package:pinterest/views/home/home_widgets/listview_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "Wallpapers";
  int selected = 0;
  List<TopicModel> topics = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<String> buildList(_queryBuild) async {
    return _queryBuild;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            color: Colors.black,
            height: 50,
            child: FutureBuilder(
              future: UnsplashRepositories.fetchTopics(
                  page: 1, perPage: 20, orderBy: "featured"),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return Container();
                } else {
                  List<TopicModel> data = snap.data as List<TopicModel>;
                  if (topics.length < 20) {
                    topics.addAll(data);
                  }
                  query = topics[0].title;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          var _query = topics[index].title;
                          setState(() {
                            query = _query;
                            selected = index;
                          });
                        },
                        child: selected == index
                            ? Card(
                                semanticContainer: true,
                                color: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    topics[index].title,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                              )
                            : Card(
                                semanticContainer: true,
                                color: Colors.grey[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    topics[index].title,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                              ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          if (query != "")
            Expanded(
                key: Key(query),
                child: ListViewImage(
                  page: 1,
                  query: query,
                ))
        ],
      ),
    );
  }
}
