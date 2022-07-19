class Comment {
  int id;
  int postId;
  String name;
  String email;
  String body;

  Comment({this.id, this.postId, this.name, this.email, this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
