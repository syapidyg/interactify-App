// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactify_app/Pages/publications.dart';
import 'package:interactify_app/routes/app_routes.dart';

void main() {
  runApp(const interactify());
}

class interactify extends StatefulWidget {
  const interactify({super.key});

  @override
  State<interactify> createState() => _interactifyState();
}

class _interactifyState extends State<interactify> {
  final bool _isDarkMode = false;

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
      locale: const Locale("en"),
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.urbanistTextTheme(),
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
