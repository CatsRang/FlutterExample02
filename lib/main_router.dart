import 'package:flutter/material.dart';

import 'home/home_view.dart';
import 'login/login_view.dart';

class RoutePaths {
  static const String Login = '/Login';
  static const String Home = '/';
}

class MainRouter {
  static Route<dynamic> generateRoute(RouteSettings rs) {
    switch (rs.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (context) => LoginView());
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (context) => HomeView());
      default:
        // @Error: should not happen
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(child: Text('Page Not Found: ${rs.name}')),
                ));
    }
  }
}
