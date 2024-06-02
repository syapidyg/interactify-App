import 'package:flutter/material.dart';

class ButtonBlackBorder extends StatelessWidget {
  const ButtonBlackBorder({super.key, required this.texte});

  final String texte;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Color(0xFF051C24), width: 1),
            fixedSize: Size(330, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {},
        child: Text(
          texte,
          style:
              TextStyle(color: Color(0xFF051C24), fontWeight: FontWeight.w600),
        ));
  }
}
