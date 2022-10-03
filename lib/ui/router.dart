import 'package:default_project/ui/books/books_page.dart';
import 'package:default_project/ui/home/home_page.dart';
import 'package:default_project/ui/langugaes/languages_pages.dart';
import 'package:default_project/ui/splash/splash_page.dart';
import 'package:default_project/utils/constants.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case booksPage:
        return MaterialPageRoute(builder: (_) => BooksPage());
      case languagesPage:
        return MaterialPageRoute(builder: (_) => LanguagesPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
