import 'package:flutter/material.dart';

class PublicationPage extends StatefulWidget {
  static const routeName = "/publications";

  const PublicationPage({super.key});

  @override
  _PublicationPageState createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Post",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/profil.jpeg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "Jane Cooper",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "# Ecris comme tu le penses!",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: IconButton(
                  icon: Icon(Icons.image, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
