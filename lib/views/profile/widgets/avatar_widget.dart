import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // ignore: avoid_print
    // print(user!.photoURL.toString());
    if (user!.photoURL.toString() == "null") {
      return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                child: Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1607344645866-009c320b63e0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjAzNzh8MHwxfGNvbGxlY3Rpb258Mnw4NDM5NTA1fHx8fHwyfHwxNjQxMzA5MzU0&ixlib=rb-1.2.1&q=80&w=1080"),
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              user.displayName.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Text(
            "${user.email}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      );
    }
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Align(
            alignment: Alignment.center,
            child: ClipRRect(
              child: Image(
                image: NetworkImage(user.photoURL.toString()),
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              ),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            user.displayName.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Text(
          "${user.email}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
