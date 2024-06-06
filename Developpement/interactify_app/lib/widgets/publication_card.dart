import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interactify_app/models/publication.dart';
import 'package:interactify_app/models/commentaire.dart';
import 'package:interactify_app/models/like.dart';
import 'package:interactify_app/services/publication_service.dart';

class PublicationCard extends StatefulWidget {
  final Publication publication;

  PublicationCard({Key? key, required this.publication}) : super(key: key);

  @override
  _PublicationCardState createState() => _PublicationCardState();
}

class _PublicationCardState extends State<PublicationCard> {
  bool isLiked = false;
  bool isExpanded = false;
  List<Commentaire> comments = [];
  final PublicationService _PublicationService = PublicationService();

  @override
  void initState() {
    super.initState();
    if (widget.publication.likes != null) {
          isLiked = widget.publication.likes!.any((like) => like.userId == widget.publication.utilisateur.id);
        }    
    _loadComments();
  }

  void toggleLike() async {
    if (widget.publication.likes != null) {
    if (isLiked) {
      // Remove like
      Like like = widget.publication.likes!.firstWhere((like) => like.userId == widget.publication.utilisateur.id);
      await _PublicationService.removeLike(widget.publication.id, like.id);
      setState(() {
        isLiked = false;
        widget.publication.likes!.remove(like);
      });
    } else {
      // Add like
      Like newLike = Like(id: '', userId: widget.publication.utilisateur.id);
      await _PublicationService.addLike(widget.publication.id, newLike);
      setState(() {
        isLiked = true;
        widget.publication.likes!.add(newLike);
      });
    }
    }
  }

  void _loadComments() async {
    comments = await _PublicationService.getComments(widget.publication.id);
    setState(() {});
  }

  void _addComment(String content) async {
    Commentaire newComment = Commentaire(id: '', content: content, userId: widget.publication.utilisateur.id);
    await _PublicationService.addComment(widget.publication.id, newComment);
    _loadComments(); // Reload comments to display the new one
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
          width: 2, // Bordure grise
        ),
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
                  backgroundImage: NetworkImage(widget.publication.utilisateur.photo! ?? 'https://static.vecteezy.com/ti/vecteur-libre/t1/2318271-icone-de-profil-utilisateur-vectoriel.jpg'),
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
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isExpanded
                      ? widget.publication.description
                      : widget.publication.description.length > 100
                          ? widget.publication.description.substring(0, 100) + '...'
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
                  child: Image.network(
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
                      Text("${widget.publication.likes?.length ?? 0}"),
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
                    '${widget.publication.commentaires?.length ?? 0} commentaires',
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
                      onTap: toggleLike,
                      child: Icon(
                        isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Display comments section
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CommentSection(
                            publication: widget.publication,
                            comments: comments,
                            addComment: _addComment,
                          ),
                        );
                      },
                      child: Icon(FontAwesomeIcons.commentDots),
                    ),
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

class CommentSection extends StatelessWidget {
  final Publication publication;
  final List<Commentaire> comments;
  final Function(String) addComment;

  CommentSection({required this.publication, required this.comments, required this.addComment});

  @override
  Widget build(BuildContext context) {
    TextEditingController _commentController = TextEditingController();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index].content),
                );
              },
            ),
          ),
          TextField(
            controller: _commentController,
            decoration: InputDecoration(
              labelText: 'Add a comment',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  addComment(_commentController.text);
                  _commentController.clear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
