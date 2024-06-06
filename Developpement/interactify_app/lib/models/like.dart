class Like {
  final String id;
  final String userId;

  Like({
    required this.id,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
    };
  }

  factory Like.fromJson(Map<String, dynamic> data) {
    return Like(
      id: data['id'],
      userId: data['userId'],
    );
  }
}
