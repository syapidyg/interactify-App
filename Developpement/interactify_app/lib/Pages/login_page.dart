import 'package:flutter/material.dart';
import 'package:interactify_app/widgets/Button_black_border.dart';
import 'package:interactify_app/widgets/button_black.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/Login";

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width * 0.6;
    double imageHeight = MediaQuery.of(context).size.height * 0.5;
    String imagePath = "assets/images/celfirst.png";
    String imageInteractify = "assets/images/logo.jpg";
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              width: imageWidth,
              height: imageHeight,
              imagePath,
              fit: BoxFit.fill,
            ),
            ButtonBlack(texte: "Login"),
            ButtonBlackBorder(
              texte: "Register",
            ),
            Container(
              child: Text("Continue as a guest"),
            )
          ],
        ),
      ),
    ));
  }
}
