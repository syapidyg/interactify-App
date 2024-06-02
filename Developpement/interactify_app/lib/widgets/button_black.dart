import 'package:flutter/material.dart';

class ButtonBlack extends StatelessWidget {
  const ButtonBlack({super.key, required this.texte, required this.routeName});

  final String texte;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF051C24), // Button background color
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Color(0xFF051C24), width: 1),
          ),
        ),
        child: Text(
          texte,
          style: TextStyle(
            color: Colors.white, // Button text color
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
