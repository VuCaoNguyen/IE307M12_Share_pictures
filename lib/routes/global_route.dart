import 'package:flutter/material.dart';
import 'package:pinterest/views/components_screens/error_screen.dart';
import 'package:pinterest/views/message/message_screen/message_screen.dart';
import 'package:pinterest/views/profile/profile_screen.dart';
import 'package:pinterest/views/search/search_screen/search_screen.dart';
import 'package:pinterest/views/splash_screen.dart';

class RouteController {
  static Route<dynamic> routeController(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        (context) => const SplashScreen();
        break;

      case '/search':
        (context) => const SearchScreen();
        break;

      case '/messages':
        (context) => const Messages();
        break;

      case '/profile':
        (context) => const Profile();
        break;

      default:
        throw ('404 not found!!!');
    }
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
