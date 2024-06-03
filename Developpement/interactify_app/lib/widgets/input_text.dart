import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatefulWidget {
  final String hintText;

  const InputText({super.key, required this.hintText});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Color(0xFF2EA3F8),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF7F8F9),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontFamily: GoogleFonts.urbanist.toString()),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.3,
              )),
        ));
  }
}
