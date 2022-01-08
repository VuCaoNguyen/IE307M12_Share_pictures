import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinterest/views/auth/login/login.dart';
import 'package:pinterest/views/auth/register.dart';
import 'package:pinterest/views/home/home_widgets/bottom_navigation_widget.dart';
import 'package:pinterest/views/message/message_screen/message_screen.dart';
import 'package:pinterest/views/profile/profile_screen.dart';
import 'package:pinterest/views/search/search_screen/search_screen.dart';
import 'package:pinterest/views/setting/setting_screen/setting_screen.dart';
import 'package:pinterest/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  final _appTitle = 'Pixabay Photos App';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        title: _appTitle,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return SplashScreen();
              }
              if (userSnapshot.hasData) {
                return const BottomNavigationWiget();
              }
              return const Login();
            }),
        routes: {
          '/home': (context) => const BottomNavigationWiget(),
          '/search': (context) => const SearchScreen(),
          '/messages': (context) => const Messages(),
          '/profile': (context) => const Profile(),
          '/login': (context) => const Login(),
          '/register': (context) => const Register(),
          '/settings': (context) => const SettingScreen(),
        });
  }
}
