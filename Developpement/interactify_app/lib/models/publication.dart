import 'package:interactify_app/models/commentaire.dart';
import 'package:interactify_app/models/like.dart';
import 'package:interactify_app/models/users.dart';

class Publication {
  final String id;
  final Users utilisateur;
  final String datePublication;
  final String description;
  final String? image;
  final List<Like>? likes;
  final List<Commentaire>? commentaires;

  Publication({
    required this.id,
    required this.utilisateur,
    required this.datePublication,
    required this.description,
    this.image,
    this.likes,
    this.commentaires,
  });
}
