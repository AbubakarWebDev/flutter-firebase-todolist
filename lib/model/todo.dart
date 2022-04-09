class Todo {
  String id;
  String title;
  String description;
  DateTime createdTime;
  bool isCompleted;

  Todo({
    required this.title,
    required this.createdTime,
    this.id = "",
    this.description = "",
    this.isCompleted = false,
  });

  static Todo fromJson(Map<String, dynamic> json){
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      createdTime: json['createdTime'].toDate(),
    );
  } 

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdTime': createdTime.toUtc()
    };
  }
}
