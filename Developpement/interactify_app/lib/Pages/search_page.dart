import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search";

  const SearchPage({super.key});
  

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(137, 56, 55, 55),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Johson Carter',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(137, 56, 55, 55),
                                fontSize: 18,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    // Effacer le contenu de la zone de recherche
                    _searchController.clear();
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          // Effacer le contenu de la zone de recherche
                          _searchController.clear();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profil.jpeg"),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jane Cooper',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Container(
            width: double.infinity,
            height: 2,
            color: const Color.fromARGB(255, 190, 216, 238),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profil.jpeg"),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jane Cooper',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Container(
            width: double.infinity,
            height: 2,
            color: const Color.fromARGB(255, 190, 216, 238),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
