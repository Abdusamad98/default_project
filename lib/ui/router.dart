import 'package:default_project/ui/home/home_page.dart';
import 'package:default_project/ui/other/other_page.dart';
import 'package:default_project/ui/splash/splash_page.dart';
import 'package:default_project/ui/users/users_page.dart';
import 'package:default_project/utils/constants.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case otherPage:
        return MaterialPageRoute(builder: (_) => OtherPage());
      case usersPage:
        return MaterialPageRoute(builder: (_) => UsersPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
