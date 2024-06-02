import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPassword extends StatefulWidget {
  final String hintText;

  const InputPassword({super.key, required this.hintText});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: _isObscured,
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
                width: 0.1,
              )),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
        ));
  }
}
