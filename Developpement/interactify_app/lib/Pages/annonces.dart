//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interactify_app/widgets/annonceCard.dart';
import 'package:interactify_app/widgets/head.dart';
import 'package:interactify_app/widgets/nav_bar.dart';



class Annonces extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Annonces> {
  final List<AnnonceCard> annonces = [];


  /*@override
  void initState() {
    super.initState();
    _loadAnnonce();
  }

  Future<void> _loadAnnonce() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('annonces')
      .get();

    querySnapshot.docs.forEach((doc) {
      annonces.add(
        AnnonceCard(
          photoProfil: doc['photoProfil'],
          username: doc['username'],
          cours: doc['cours'],
          datePublication: doc['datePublication'],
          description: doc['description'],
        ),
      );
    });
  }*/

  @override
  Widget build(BuildContext context) {
    annonces.add(
        const AnnonceCard
        (
              photoProfil: 'assets/images/marx.png',
              username: 'John Doe',
              cours: 'Anglais',
              datePublication: 'Jan 1, 2023',
              description: 'This is a test publication.',
      ),
      );
      annonces.add(
         const AnnonceCard(
              photoProfil: 'assets/images/logo.png',
              username: 'Axcel TCHIFFO',
              datePublication: 'Jun 3, 2024',
              description: 'This is my first post.', 
              cours: 'Base de donnees',
      ),
      );
      annonces.add(
        const AnnonceCard(
              photoProfil: 'assets/images/v7.jpg',
              username: 'Sopho PICHICHI',
              cours: 'Reseau',
              datePublication: 'Jun 3, 2024',
              description: 'This is my first post.',
      ),
      );
    return Scaffold(
      appBar: const Head(),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          children: annonces,
        ),
      ),
      bottomNavigationBar: NavBar(),
      );
  }
}