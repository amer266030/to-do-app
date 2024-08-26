class Task {
  int id;
  String title;
  bool isCompleted;
  DateTime timeStamp;
  int categoryId;

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.timeStamp,
    required this.categoryId,
  });
}
