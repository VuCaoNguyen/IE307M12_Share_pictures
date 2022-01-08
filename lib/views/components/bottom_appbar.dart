import 'package:flutter/material.dart';

class ComponentBottomNavigationBar extends StatefulWidget {
  const ComponentBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<ComponentBottomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(40),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: const Color.fromRGBO(41, 41, 41, 1)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  return;

                case 1:
                  Navigator.pushNamed(context, '/search');
                  break;

                case 2:
                  Navigator.pushNamed(context, '/messages');
                  break;

                case 3:
                  Navigator.pushNamed(context, '/profile');
                  break;

                default:
                  throw Exception("Invalid route!!!");
              }
              setState(() {
                _currentIndex = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: "Messgage",
                icon: Icon(
                  Icons.messenger,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
