import 'package:flutter/material.dart';
import 'package:interactify_app/models/publication.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({super.key, required this.publication});

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    bool click = false;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    void _changeClick() {
      click = true;
    }

    return Container(
      color: Colors.blue,
      width: screenWidth * 0.8,
      height: screenHeigth * 0.6,
      child: Card(
        margin: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(publication.photoProfil),
                    radius: 30,
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          publication.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, top: 5),
                        child: Text(
                          publication.promotion,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1, top: 2),
                        child: Text(
                          publication.datePublication,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: Icon(Icons.apps),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 10, left: 20, right: 10),
              child: Text(publication.description),
            ),
            if (publication.image != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset(
                      publication.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.heart_broken,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 4.0),
                      Text('$publication.likes'),
                    ],
                  ),
                  Text(
                    '$publication.commentaires commentaires',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 2,
              thickness: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _changeClick();
                    },
                    child: Icon(Icons.monitor_heart_rounded,
                        color: click == true ? Colors.red : Colors.grey),
                  ),
                  const Icon(Icons.comment_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
