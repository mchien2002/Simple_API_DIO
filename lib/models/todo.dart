class Todo {
  int id;
  int userId;
  String title;
  String dueOn;
  String status;

  Todo({this.id, this.userId, this.title, this.dueOn, this.status});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    dueOn = json['due_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['due_on'] = this.dueOn;
    data['status'] = this.status;
    return data;
  }
}
