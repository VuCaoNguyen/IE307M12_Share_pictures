import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(41, 41, 41, 1),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              onTap: () {
             
              },
              leading: CircleAvatar(
                backgroundColor: Colors.redAccent,
                radius: 22,
                child: Icon(
                  Icons.chat_rounded,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "New message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListTile(
            onTap: () {
            
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey[700],
              radius: 22,
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              "Username $index",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "Lasted message",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
