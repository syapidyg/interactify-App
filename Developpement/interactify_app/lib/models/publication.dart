class Publication {
  final String photoProfil;
  final String username;
  final String promotion;
  final String datePublication;
  final String description;
  final String? image;
  final int likes;
  final int commentaires;

  Publication({
    required this.photoProfil,
    required this.username,
    required this.datePublication,
    required this.description,
    this.image,
    required this.likes,
    required this.commentaires,
    required this.promotion,
  });
}
