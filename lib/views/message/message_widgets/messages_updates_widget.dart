import 'package:flutter/material.dart';
import 'package:pinterest/views/message/message_widgets/recommend_collection_widget.dart';

class Updates extends StatefulWidget {
  const Updates({Key? key}) : super(key: key);

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        extendBody: true,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Collections New",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RecommendCollectionWidgetGridView(
                      key: Key(page.toString()),
                      page: 1,
                      perPage: 5 * page,
                      onPresss: () {
                        setState(() {
                          page = page + 1;
                         
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
