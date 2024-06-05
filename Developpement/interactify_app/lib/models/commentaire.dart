class Commentaire {
  final String id;
  final String content;
  final String userId;

  Commentaire({
    required this.id,
    required this.content,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'userId': userId,
    };
  }

  factory Commentaire.fromJson(Map<String, dynamic> data) {
    return Commentaire(
      id: data['id'],
      content: data['content'],
      userId: data['userId'],
    );
  }
}
