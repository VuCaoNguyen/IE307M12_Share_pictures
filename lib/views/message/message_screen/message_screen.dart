import 'package:flutter/material.dart';
import 'package:pinterest/views/message/message_widgets/messages_messages_widget.dart';
import 'package:pinterest/views/message/message_widgets/messages_updates_widget.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);
  @override
  MessagesState createState() => MessagesState();
}

class MessagesState extends State<Messages>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        automaticallyImplyLeading: false,
        actions: [
          Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 35, 0),
              child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onPressed: () {},
                  icon: const Icon(Icons.settings))),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.fromLTRB(70, 0, 20, 0),
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(38, 38, 38, 1)),
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text("Updates"),
                  ),
                  Tab(
                    child: Text("Messages"),
                  )
                ],
              ),
            ))
          ],
        ),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [Updates(), Message()],
      ),
    );
  }
}
