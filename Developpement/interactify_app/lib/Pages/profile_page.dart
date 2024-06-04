import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile/user";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Jerome Bell',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // Ajouter la logique de prise de photo ici
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/marx.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Text("@Name Surname",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          Text("Posts",
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "X2025",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          Text("Promotion",
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "50",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          Text("Following",
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Bienvenue dans mon univers. Je domine le monde et j’ai des amis.",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
