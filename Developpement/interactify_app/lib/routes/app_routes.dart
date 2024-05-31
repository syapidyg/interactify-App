import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/my_home_page.dart';
import 'package:interactify_app/widgets/nav_bar.dart';

class AppRoutes {
  static Route<dynamic> generateRoute({
    required RouteSettings routeSettings,
  }) {
    switch (routeSettings.name) {
      // case "AppTest.routeName":
      //   return MaterialPageRoute<void>(
      //     settings: routeSettings,
      //     builder: (BuildContext context) => const AppTest() ,
      //   );
      default:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => NavBar(),
        );
    }
  }
}
