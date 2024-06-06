import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:interactify_app/models/Users.dart';
import 'package:interactify_app/services/user_service.dart';
import 'package:interactify_app/widgets/nav_bar.dart';
import 'package:interactify_app/widgets/search_bar.dart';
import 'package:interactify_app/widgets/search_element_row.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search";
  SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final userService = UserService();

  final TextEditingController _searchController = TextEditingController();
  Users user1 = Users(
      id: "21",
      photo: "assets/images/user.png",
      username: "username",
      promotion: "X2027",
      email: "yves@gmail.com");
  Users user2 = Users(
      id: "21",
      photo: "assets/images/user.png",
      username: "Axcel",
      promotion: "X2027",
      email: "yves@gmail.com");
  Users user3 = Users(
      id: "21",
      photo: "assets/images/user.png",
      username: "Chabain",
      promotion: "X2027",
      email: "yves@gmail.com");

  List<Users> _foundUser = [];
  List<SearchElement> searchelements = [];
  List<SearchElement> foundElements = [];
  List<Users> userList = [];
  List<Users> userL = [];
  Future<List<Users>> fetchUser() async {
    final userService = UserService();
    userList = await userService.getAllUsers();

    for (var element in userList) {
      userL.add(Users(element.id, element.photo, element.username, element.promotion));
    }
    print(userList);
    return await userService.getAllUsers();
  }

  @override
  void initState() {
    fetchUser();
    _foundUser.addAll(userList);
    for (var user in _foundUser) {
      searchelements.add(SearchElement(user: user));
    }
    foundElements = searchelements;
    super.initState();
  }

  void _runFilter(String value) {
    List<SearchElement> results = [];
    results = searchelements;
    if (value.isEmpty) {
      results = searchelements;
    } else {
      results = searchelements
          .where((searchElement) => searchElement.user.username
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      foundElements = results;
      print(searchelements.length);
      print(foundElements.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SearchingBar(
                controllerTextEditing: _searchController,
                runFilter: _runFilter),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foundElements.length,
              itemBuilder: (context, index) {
                return foundElements[index];
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
