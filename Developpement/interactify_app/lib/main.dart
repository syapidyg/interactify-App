import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:interactify_app/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  // void _toggleTheme(bool isDarkMode) {
  //   setState(() {
  //     _isDarkMode = isDarkMode;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("en"),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      //   onGenerateRoute: (settings) => AppRoutes.generateRoute(
      //       routeSettings: settings,
      //       isDarkMode: _isDarkMode,
      //       toggleTheme: _toggleTheme),
      // );
      onGenerateRoute: (settings) => AppRoutes().generateRoute(
        routeSettings: settings,
        // isDarkMode: _isDarkMode,
        // toggleTheme: _toggleTheme,
      ),
    );
  }
}
