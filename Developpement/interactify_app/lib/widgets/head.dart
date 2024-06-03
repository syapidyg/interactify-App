// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Head extends StatelessWidget implements PreferredSizeWidget {
  const Head({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Interactify',
        style: TextStyle(
          fontFamily: 'Yesteryear',
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon:  const Icon(Icons.message),
          onPressed: () {
            Navigator.pushNamed(context, '/messages');
          },
        ),
      ],
      backgroundColor: Color(0xFF2EA3F8),
    );
  
  }
}