import 'package:interactify_app/models/publication.dart';
import 'package:interactify_app/models/utilisateur.dart';

class Commentaire {
  final Utilisateur utilisateur;
  final Publication publication;
  final String contenu;

  Commentaire({required this.utilisateur, required this.publication, required this.contenu});
}