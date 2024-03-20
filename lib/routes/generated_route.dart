import 'package:flutter/material.dart';
import 'package:flutter_task/presentaion/screens/bottom_nav_bar_screen.dart';
import 'package:flutter_task/presentaion/screens/search_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const BottomNavBarScreen(),
        );
      case '/search_screen':
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        );
      default:
        return null;
    }
  }
}
