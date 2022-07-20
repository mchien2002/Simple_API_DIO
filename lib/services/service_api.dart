// ignore_for_file: missing_return, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:my_api_app/models/comment.dart';
import 'package:my_api_app/models/post.dart';
import 'package:my_api_app/models/todo.dart';
import '../models/user.dart';

// ignore: duplicate_ignore
class ServiceAPI{
  final String baseURL = "https://gorest.co.in/public/v2/";
  Dio _dio;

  ServiceAPI(){
    _dio = Dio(BaseOptions(baseUrl: baseURL));
  }

  // Chuyển json thành list bằng dio
  // ignore: missing_return
  Future<List<User>> getListUser(String endPoint) async {
    ServiceAPI();
    List<User> listUsers;

    try{
      Response response = await _dio.get(endPoint);
      if (response.statusCode == 200){
        var getUserData = response.data as List;
        listUsers = getUserData.map((i) => User.fromJson(i)).toList();
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

  Future<List<Post>> getListPost(String endPoint) async {
    List<Post> listPosts;
    try{
      Response response = await _dio.get(endPoint);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        listPosts = getUserData.map((i) => Post.fromJson(i)).toList();
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

  Future<List<Comment>> getListComment(String endPoint) async {
    List<Comment> listComments;
    try{
      Response response = await _dio.get(endPoint);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        listComments = getUserData.map((i) => Comment.fromJson(i)).toList();
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
  Future<List<Todo>> getListTodo(String endPoint) async {
    List<Todo> listTodos;
    try{
      Response response = await _dio.get(endPoint);

      if (response.statusCode == 200){
        var getUserData = response.data as List;
        listTodos = getUserData.map((i) => Todo.fromJson(i)).toList();
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