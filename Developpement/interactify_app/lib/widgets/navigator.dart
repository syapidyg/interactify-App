import 'package:flutter/material.dart';

class Navigator extends StatefulWidget {
  const Navigator({super.key});

  @override
  State<Navigator> createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Pour vous',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: _selectedIndex == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (_selectedIndex == 0)
                          Container(
                            width: 80,
                            height: 2,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Annonce',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: _selectedIndex == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (_selectedIndex == 1)
                          Container(
                            width: 80,
                            height: 2,
                            color: Colors.blue,
                          ),
                      ],
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
