import 'package:flutter/material.dart';

class ComponentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final Icon icon;
  const ComponentAppBar(
      {Key? key, required this.appBarHeight, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: icon,
            color: Colors.white,
            onPressed: (){}
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_horiz, size: 35, color: Colors.white),
              onPressed: () {})
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
