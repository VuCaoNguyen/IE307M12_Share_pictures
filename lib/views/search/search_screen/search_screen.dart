import 'package:flutter/material.dart';
import 'package:pinterest/views/search/search_widgets/images_recommend_widget.dart';
import 'package:pinterest/views/search/search_widgets/recommend_topics_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, bottom: 15),
            child: InkWell(
              onTap: () {
                // showSearch(context: context, delegate: SearchWidget());
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImagesRecommendTopicWidget(
                          query: "Car",
                          focus: true,
                        )));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.grey[800],
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[300],
                      ),
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.grey[300], fontSize: 16),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Icon(
                        Icons.camera_enhance_outlined,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Ideal for you",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      RecommendTopicsGridViewWidget(
                        page: 1,
                        perPage: 6,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Popular on app",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      RecommendTopicsGridViewWidget(
                        page: 2,
                        perPage: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
