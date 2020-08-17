import 'package:app_artisans_test/UI/views/pages/user_details.dart';
import 'package:app_artisans_test/UI/views/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'router_path_const.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case usersPageRoute:
        return MaterialPageRoute(builder: (_) => UsersPage());
      case userDetailsPageRoute:
        final user = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => UserDetailsPage(
                  user: user,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  ///Singleton factory
  static final Router _instance = Router._internal();
  factory Router() {
    return _instance;
  }
  Router._internal();
}
