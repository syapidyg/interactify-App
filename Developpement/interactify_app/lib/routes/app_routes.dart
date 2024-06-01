import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/on_boarding_page.dart';
import 'package:interactify_app/models/on_boarding.dart';
import 'package:interactify_app/widgets/on_board_card.dart';

class AppRoutes {
  
  Route<dynamic> generateRoute({
    required RouteSettings routeSettings,
  }) {
    switch (routeSettings.name) {
      case "OnBoardingPage.routeName":
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) =>  OnBoardingPage() ,
        );
      default:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) =>
              // OnBoardCard(onBoarding: onBoarding),
              OnBoardingPage()
        );
    }
  }
}
