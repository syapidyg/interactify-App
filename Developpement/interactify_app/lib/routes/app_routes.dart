import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/login_page.dart';
import 'package:interactify_app/Pages/on_boarding_page.dart';

class AppRoutes {
  Route<dynamic> generateRoute({
    required RouteSettings routeSettings,
  }) {
    switch (routeSettings.name) {
      case "OnBoardingPage.routeName":
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => OnBoardingPage(),
        );
      case "LoginPage.routeName":
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => LoginPage(),
        );
      default:
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                // OnBoardCard(onBoarding: onBoarding),
                LoginPage());
    }
  }
}
