import 'package:flutter/material.dart';

class ButtonBlack extends StatelessWidget {
  const ButtonBlack({super.key, required this.texte, required this.routeName});

  final String texte;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF051C24),
            side: BorderSide(color: Color(0xFF051C24), width: 1),
            fixedSize: Size(330, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(
          texte,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
  }
}
