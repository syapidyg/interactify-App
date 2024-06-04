//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interactify_app/models/publication.dart';
import 'package:interactify_app/models/utilisateur.dart';
import 'package:interactify_app/widgets/head.dart';
import 'package:interactify_app/widgets/nav_bar.dart';
import 'package:interactify_app/widgets/publication_card.dart';

class HomePage extends StatefulWidget {

    static const routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PublicationCard> publications = [];

  Utilisateur utilisateur1 = Utilisateur(
      photoProfil: "assets/images/marx.png",
      promotion: "X2025",
      username: "SyapiDYG");

  late Publication publication1;

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
    publication1 = Publication(
        datePublication: "2015-12-4",
        description: "yyyyyyyyyy hhhhhhhhhhhhhhh hhhhhhhhhhhhhh ddddddddddddd vvvvvvvvvvvvvvvv bbbbbbbbbbbbbbb nnnnnnnnnnnnnnnn ggggggggggggggggggg ooooooooooooooooooooooo",
        image: "assets/images/Rectangle 4750.png",
        commentaires: null,
        likes: null,
        utilisateur: utilisateur1);

    PublicationCard card = PublicationCard(publication: publication1);
    publications.add(card);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Head(),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        children: publications,
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
