import 'package:flutter/material.dart';
import 'package:interactify_app/pages/annonces_page.dart';
import 'package:interactify_app/pages/home_page.dart';

class Navigators extends StatefulWidget {
  final int number;
  const Navigators({Key? key, required this.number}) : super(key: key);

  @override
  _NavigatorsState createState() => _NavigatorsState();
}

class _NavigatorsState extends State<Navigators> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            });
          },
          child: _buildNavItem('Pour vous', 0),
        ),
        const SizedBox(width: 32),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 1;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Annonces()),
              );
            });
          },
          child: _buildNavItem('Annonce', 1),
        ),
      ],
    );
  }

  Widget _buildNavItem(String text, int number) {
    bool isSelected = widget.number == number;
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        const SizedBox(height: 4),
        if (isSelected)
          Container(
            width: 80,
            height: 2,
            color: Colors.blue,
          ),
      ],
    );
  }
}
