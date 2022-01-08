import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => Home());
      // case '/love':
      //   return MaterialPageRoute(builder: (_) => const Favorite());
      // case '/profile':
      //   return MaterialPageRoute(builder: (_) => const Profile());

      // case '/settings':
      //   return MaterialPageRoute(builder: (_) => const Settings());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
