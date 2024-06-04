import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/profile_page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (_currentIndex) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/search');
        break;
      case 2:
        Navigator.pushNamed(context, '/post');
        break;
      case 3:
        Navigator.pushNamed(context, '/notifications');
        break;
      case 4:
        Navigator.pushNamed(context, ProfilePage.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: ('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded),
          label: ('Post'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: ('Notifications'),
          
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage("assets/images/v6.jpg"),
          ),
          label: ('Profil'),
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: const  Color(0xFF04BBFF),
      unselectedItemColor: Colors.black,
      onTap: _onTabTapped,
    );
  }
}