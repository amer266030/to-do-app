class Task {
  int id;
  String title;
  bool isCompleted;
  String timeStamp;
  int categoryId;

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.timeStamp,
    required this.categoryId,
  });

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        isCompleted = json['isCompleted'] as bool,
        timeStamp = json['timeStamp'] as String,
        categoryId = json['categoryId'] as int;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isCompleted': isCompleted,
        'timeStamp': timeStamp,
        'categoryId': categoryId
      };
}
