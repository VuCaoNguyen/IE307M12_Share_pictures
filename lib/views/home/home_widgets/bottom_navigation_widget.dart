import 'package:flutter/material.dart';
import 'package:pinterest/views/home/home_screen/home_screen.dart';
import 'package:pinterest/views/message/message_screen/message_screen.dart';
import 'package:pinterest/views/profile/profile_screen.dart';
import 'package:pinterest/views/search/search_screen/search_screen.dart';

class BottomNavigationWiget extends StatefulWidget {
  const BottomNavigationWiget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWiget> createState() => _BottomNavigationWigetState();
}

class _BottomNavigationWigetState extends State<BottomNavigationWiget> {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void ontapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
          });
        },
        controller: pageController,
        children: const [HomeScreen(), SearchScreen(), Messages(), Profile()],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                  ),
                  label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile')
            ],
            currentIndex: selectedIndex,
            onTap: ontapped,
          ),
        ),
      ),
    );
  }
}
