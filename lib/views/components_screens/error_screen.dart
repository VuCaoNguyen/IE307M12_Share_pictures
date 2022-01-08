import 'package:flutter/material.dart';
import 'package:pinterest/views/components/appbar.dart';
import 'package:pinterest/views/components/bottom_appbar.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ComponentAppBar(
          appBarHeight: 60,
          icon: Icon(Icons.person),
        ),
        body: Text('Error',
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.red[400],
                fontSize: 30,
                fontWeight: FontWeight.w900)),
        bottomNavigationBar: const ComponentBottomNavigationBar());
  }
}
