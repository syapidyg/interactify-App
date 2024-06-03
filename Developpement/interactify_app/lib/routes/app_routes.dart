import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/confirm_password_change_page.dart';
import 'package:interactify_app/Pages/create_new_password_page.dart';
import 'package:interactify_app/Pages/forget_password_page.dart';
import 'package:interactify_app/Pages/login_page.dart';
import 'package:interactify_app/Pages/login_register_page.dart';
import 'package:interactify_app/Pages/on_boarding_page.dart';
import 'package:interactify_app/Pages/register_page.dart';

class AppRoutes {
  Route<dynamic> generateRoute({
    required RouteSettings routeSettings,
  }) {
    switch (routeSettings.name) {
      case OnBoardingPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => OnBoardingPage(),
        );
      case LoginRegisterPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => LoginRegisterPage(),
        );
      case RegisterPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => RegisterPage(),
        );
      case LoginPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => LoginPage(),
        );
      case ForgetPasswordPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => ForgetPasswordPage(),
        );
      case CreateNewPasswordPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => CreateNewPasswordPage(),
        );
      case PasswordConfirmPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => PasswordConfirmPage(),
        );
      default:
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) =>
                // OnBoardCard(onBoarding: onBoarding),
                OnBoardingPage());
    }
  }
}
