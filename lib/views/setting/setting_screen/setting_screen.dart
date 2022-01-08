import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Personal information",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Edit profile",
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Account settings",
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Permissions",
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Notifications",
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Privacy & data",
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Homefeed tuner",
                ),
                onTap: () {},
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Actions",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Add account",
                  showIcon: false,
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Log out",
                  showIcon: false,
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Support",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "Get help",
                  showIcon: false,
                ),
                onTap: () {},
              ),
              InkWell(
                child: OptionSettingButton(
                  textOption: "See terms and privacy",
                  showIcon: false,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class OptionSettingButton extends StatelessWidget {
  const OptionSettingButton({
    Key? key,
    required this.textOption,
    this.showIcon = true,
  }) : super(key: key);
  final String textOption;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 18, color: Colors.white);
    return Container(
      margin: EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textOption,
            style: style,
          ),
          showIcon
              ? Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                )
              : Container()
        ],
      ),
    );
  }
}
