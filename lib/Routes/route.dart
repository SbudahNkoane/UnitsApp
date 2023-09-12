import 'package:flutter/material.dart';
import 'package:unit_reflections/Views/Pages/home_page.dart';
import 'package:unit_reflections/Views/Pages/unit_select_page.dart';

class RouteManager {
  static const String homePage = '/';
  static const String unitSelectPage = '/unitSelectPage';

  RouteManager._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case unitSelectPage:
        return MaterialPageRoute(
          builder: (context) => const UnitSelectPage(),
        );
      default:
        throw const FormatException('This Page does not exist!!');
    }
  }
}
