import 'package:interactify_app/models/publication.dart';
import 'package:interactify_app/models/utilisateur.dart';

class Like {
  final Utilisateur utilisateur;
  final bool isLiked;

  Like(this.isLiked, {required this.utilisateur});
}
