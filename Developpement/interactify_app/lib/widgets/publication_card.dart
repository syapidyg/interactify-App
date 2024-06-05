// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:interactify_app/models/commentaire.dart';
//import 'package:interactify_app/models/like.dart';
import 'package:interactify_app/models/publication.dart';

class PublicationCard extends StatefulWidget {
  Publication publication;

  PublicationCard({
    super.key,
    required this.publication,
  });

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  bool click = false;
  bool isExpanded = false;

  void changeClick() {
    setState(() {
      click = !click;
    });
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Coins carrés
        side: BorderSide(
            color: Color.fromARGB(50, 173, 171, 170),
            width: 2), // Bordure grise
      ),
      margin: EdgeInsets.only(
          bottom: screenWidth * 0.016,
          left: screenWidth * 0.01,
          right: screenWidth * 0.01),
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      AssetImage(widget.publication.utilisateur.photoProfil),
                  radius: 30,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          widget.publication.utilisateur.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, top: 5),
                        child: Text(
                          widget.publication.utilisateur.promotion,
                          style: const TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, top: 2),
                        child: Text(
                          widget.publication.datePublication,
                          style: const TextStyle(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isExpanded
                      ? widget.publication.description
                      : widget.publication.description.length > 100
                          ? widget.publication.description.substring(0, 100) +
                              '...'
                          : widget.publication.description,
                  overflow: TextOverflow.clip,
                ),
                if (widget.publication.description.length > 100)
                  GestureDetector(
                    onTap: toggleExpansion,
                    child: Text(
                      isExpanded ? "Voir moins" : "Voir plus...",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
              ],
            ),
          ),
          if (widget.publication.image != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width * 0.95,
                    widget.publication.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 10.0),
                      Text(
                          "${widget.publication.likes?.length == null ? "0" : widget.publication.likes?.length}"),
                      const SizedBox(width: 4.0),
                      const SizedBox(width: 4.0),
                      const Text(
                        'Likes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    '${widget.publication.commentaires?.length == null ? "0" : widget.publication.commentaires?.length} commentaires',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(50, 173, 171, 170),
            height: 2,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.08),
                    InkWell(
                      onTap: changeClick,
                      child: Icon(
                        click
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: click ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.commentDots),
                    SizedBox(width: screenWidth * 0.08),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
