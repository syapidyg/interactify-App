import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/confirm_password_change_page.dart';
import 'package:interactify_app/Pages/create_new_password_page.dart';
import 'package:interactify_app/Pages/forget_password_page.dart';
import 'package:interactify_app/Pages/home_page.dart';
import 'package:interactify_app/Pages/login_page.dart';
import 'package:interactify_app/Pages/login_register_page.dart';
import 'package:interactify_app/Pages/notifications_page.dart';
import 'package:interactify_app/Pages/on_boarding_page.dart';
import 'package:interactify_app/Pages/profile_page.dart';
import 'package:interactify_app/Pages/publication_page.dart';
import 'package:interactify_app/Pages/register_page.dart';
import 'package:interactify_app/Pages/search_page.dart';
import 'package:interactify_app/models/publication.dart';

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
      case PasswordConfirmPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => PasswordConfirmPage(),
        );
      case HomePage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => HomePage(),
        );
      case ProfilePage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => ProfilePage(),
        );
      case SearchPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => SearchPage(),
        );
      case PublicationPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => PublicationPage(),
        );
      case NotificationsPage.routeName:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => NotificationsPage(),
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
