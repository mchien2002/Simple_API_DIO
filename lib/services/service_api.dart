import 'package:dio/dio.dart';
import 'package:my_api_app/models/comment.dart';
import 'package:my_api_app/models/post.dart';
import 'package:my_api_app/models/todo.dart';
import '../models/user.dart';

class ServiceAPI{
  Future<List<User>> listUsers;
  Future<List<Post>> listPosts;
  Future<List<Comment>> listComments;
  Future<List<Todo>> listTodos;

  // Chuyển json thành list bằng dio
  // ignore: missing_return
  Future<List<User>> getListUser(String baseURL) async {
    try{
      Response response = await Dio().get(baseURL);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        var listUsers = getUserData.map((i) => User.fromJson(i)).toList();
        return listUsers;
      }
      else{
        throw Exception('Failed to load users');
      }
    }
    catch(e){
        // ignore: avoid_print
        print(e);
      }
  }

  Future<List<Post>> getListPost(String baseURL) async {
    try{
      Response response = await Dio().get(baseURL);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        var listPosts = getUserData.map((i) => Post.fromJson(i)).toList();
        return listPosts;
      }
      else{
        throw Exception('Failed to load Posts');
      }
    }
    catch(e){
        // ignore: avoid_print
        print(e);
      }
  }

  Future<List<Comment>> getListComment(String baseURL) async {
    try{
      Response response = await Dio().get(baseURL);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        var listComments = getUserData.map((i) => Comment.fromJson(i)).toList();
        return listComments;
      }
      else{
        throw Exception('Failed to load Posts');
      }
    }
    catch(e){
        // ignore: avoid_print
        print(e);
      }
  }
  Future<List<Todo>> getListTodo(String baseURL) async {
    try{
      Response response = await Dio().get(baseURL);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        var listTodos = getUserData.map((i) => Todo.fromJson(i)).toList();
        return listTodos;
      }
      else{
        throw Exception('Failed to load Posts');
      }
    }
    catch(e){
        // ignore: avoid_print
        print(e);
      }
  }
  
}