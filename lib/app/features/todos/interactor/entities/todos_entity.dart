class TodosEntity {
  final int userId;
  final int id;
  final String title;
  final String? body;
  bool completed;
  bool isFavorite;
  TodosEntity({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
    required this.completed,
    this.isFavorite = false,
  });
}
