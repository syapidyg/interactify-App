import 'package:flutter/material.dart';
import 'package:interactify_app/Pages/home_page.dart';
import 'package:interactify_app/Pages/notifications_page.dart';
import 'package:interactify_app/Pages/profile_page.dart';
import 'package:interactify_app/Pages/publication_page.dart';
import 'package:interactify_app/Pages/search_page.dart';
import 'package:interactify_app/models/Users.dart';
import 'package:interactify_app/services/auth_service.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  Users? _currentUser;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() async {
    Users? user = await _authService.getCurrentUser();
    setState(() {
      _currentUser = user;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (_currentIndex) {
      case 0:
        Navigator.pushNamed(context, HomePage.routeName);
        break;
      case 1:
        Navigator.pushNamed(context, SearchPage.routeName);
        break;
      case 2:
        Navigator.pushNamed(context, PublicationPage.routeName);
        break;
      case 3:
        Navigator.pushNamed(context, NotificationsPage.routeName);
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
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ('Home'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: ('Search'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded),
          label: ('Post'),
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: ('Notifications'),
        ),
        BottomNavigationBarItem(
          icon: _currentUser != null && _currentUser!.photo != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(_currentUser!.photo!),
                )
              : const CircleAvatar(
                  child:  Icon(Icons.person),
                ),
          label: ('Profil'),
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: const Color(0xFF04BBFF),
      unselectedItemColor: Colors.black,
      onTap: _onTabTapped,
    );
  }
}
