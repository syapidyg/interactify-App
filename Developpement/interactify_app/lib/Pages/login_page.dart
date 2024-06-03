import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interactify_app/widgets/button_black.dart';
import 'package:interactify_app/widgets/input_password.dart';
import 'package:interactify_app/widgets/input_text.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Color of the border
                width: 0.3, // Width of the border
              ),
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: IconButton(
              hoverColor: Colors.transparent,
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF051C24),
              ),
              onPressed: () {
                // Handle back button press
              },
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Welcome back! Glad to see you, Again!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InputText(
                hintText: "Email",
              ),
              InputPassword(
                hintText: "Password",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ButtonBlack(texte: "Login", routeName: routeName),
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or Login with",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF051C24))),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Handle Google register button press
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 18.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [FaIcon(FontAwesomeIcons.google)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text:"Don’t have an account? " ,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle login now press
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
