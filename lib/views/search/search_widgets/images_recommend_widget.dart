import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest/views/home/home_widgets/listview_home.dart';

class ImagesRecommendTopicWidget extends StatefulWidget {
  ImagesRecommendTopicWidget({Key? key, required this.query, this.focus = false})
      : super(key: key);
  final String query;
  bool focus;
  @override
  _ListImageRecommendState createState() => _ListImageRecommendState();
}

class _ListImageRecommendState extends State<ImagesRecommendTopicWidget> {
  TextEditingController searchController = TextEditingController();
  String? queryState;
  @override
  void initState() {
    super.initState();
    searchController.text = widget.query;
  }

  @override
  Widget build(BuildContext context) {
    queryState = widget.query;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(3),
                child: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    // Set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)), // Set rounded corner radius
                  ),
                  itemColor: Colors.white,
                  itemSize: 18,
                  autofocus: widget.focus,
                  controller: searchController,
                  onSubmitted: (value) {
                    setState(() {
                      queryState = value;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                key: Key(searchController.text),
                child: ListViewImage(
                  page: 1,
                  query: searchController.text,
                ),
              ),
            ],
          ),
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
