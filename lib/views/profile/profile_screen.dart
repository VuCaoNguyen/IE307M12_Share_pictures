import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinterest/views/profile/widgets/avatar_widget.dart';
import 'package:pinterest/views/profile/widgets/your_collection_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Size size = Size.fromHeight(50.0);
  bool showAvatar = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: size,
        child: AppBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
          automaticallyImplyLeading: false,
          title: !showAvatar
              ? Center(
                  child: Text(user!.displayName.toString()),
                )
              : Text(""),
          leading: IconButton(
            icon:
                showAvatar ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
            onPressed: () {
              setState(() {
                showAvatar = !showAvatar;
                if (!showAvatar) {
                  size = Size.fromHeight(50);
                } else {
                  size = Size.fromHeight(250);
                }
              });
            },
          ),
          flexibleSpace: showAvatar ? AvatarWidget() : Text(""),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            const double sizeText = 20;
                            return SizedBox(
                                height: 200.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight:
                                              const Radius.circular(25.0))),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Profile",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          child: Text('Settings',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/settings');
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Copy profile link',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                          height: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    },
                    icon: Icon(Icons.more_horiz)))
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: SizedBox(
                          height: 40,
                          child: CupertinoSearchTextField(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              // Set border width
                              borderRadius: BorderRadius.all(Radius.circular(
                                  30)), // Set rounded corner radius
                            ),
                            itemSize: 18,
                            itemColor: Colors.white,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.slidersH,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            const double sizeText = 20;
                            return SizedBox(
                                height: 350.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight:
                                              const Radius.circular(25.0))),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "sort by",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          child: Text('A to Z',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: Text('Custom',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Manually sort your board order",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          child: Text('Last saved to',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Layout",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          child: Text('Edit board visibility',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            const double sizeText = 20;
                            return SizedBox(
                                height: 200.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight:
                                              const Radius.circular(25.0))),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "create",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ),
                                        TextButton(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Text(
                                              'Collection',
                                              style: TextStyle(
                                                fontSize: sizeText,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: Text('Board',
                                              style: TextStyle(
                                                  fontSize: sizeText,
                                                  color: Colors.white)),
                                          onPressed: () {},
                                        ),
                                        SizedBox(
                                          height: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
            Text("Your Collections",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800)),
            SizedBox(
              height: 20,
            ),
            YourCollectionWidget(
              page: 12,
              perPage: 5,
              onPresss: () {},
            ),
          ],
        ),
      ),
    );
  }
}
