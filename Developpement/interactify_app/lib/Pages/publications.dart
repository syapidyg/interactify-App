//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interactify_app/widgets/head.dart';
import 'package:interactify_app/widgets/nav_bar.dart';
import 'package:interactify_app/widgets/publication_card.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PublicationCard> publications = [];


  /*@override
  void initState() {
    super.initState();
    _loadPublications();
  }

  Future<void> _loadPublications() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('publications')
      .get();

    querySnapshot.docs.forEach((doc) {
      publications.add(
        PublicationCard(
          photoProfil: doc['photoProfil'],
          username: doc['username'],
          promotion: doc['promotion'],
          datePublication: doc['datePublication'],
          description: doc['description'],
          image: doc['image'],
          likes: doc['likes'],
          commentaires: doc['commentaires'],
        ),
      );
    });
  }*/

  @override
  Widget build(BuildContext context) {
    publications.add(
        const PublicationCard(
              photoProfil: 'assets/images/marx.png',
              username: 'John Doe',
              promotion: 'X2024',
              datePublication: 'Jan 1, 2023',
              description: 'This is a test publication.',
              image: 'assets/images/marx.png',
              likes: 10,
              commentaires: 5,
      ),
      );
      publications.add(
        const PublicationCard(
              photoProfil: 'assets/images/logo.png',
              username: 'Axcel TCHIFFO',
              promotion: 'X2025',
              datePublication: 'Jun 3, 2024',
              description: 'This is my first post.',
              image: 'assets/images/logo.png',
              likes: 150,
              commentaires: 15,
      ),
      );
      publications.add(
        const PublicationCard(
              photoProfil: 'assets/images/v7.jpg',
              username: 'Sopho PICHICHI',
              promotion: 'X2025',
              datePublication: 'Jun 3, 2024',
              description: 'This is my first post.',
              image: 'assets/images/v7.jpg',
              likes: 1500,
              commentaires: 60,
      ),
      );
    return Scaffold(
      appBar: const Head(),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        children: publications,
      ),
      bottomNavigationBar: NavBar(),
      );
  }
}