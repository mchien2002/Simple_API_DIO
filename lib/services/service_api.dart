// ignore_for_file: missing_return, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:my_api_app/models/comment.dart';
import 'package:my_api_app/models/post.dart';
import 'package:my_api_app/models/todo.dart';
import '../models/user.dart';

// ignore: duplicate_ignore
class ServiceAPI{
  List<User> listUsers;
  List<Post> listPosts;
  List<Comment> listComments;
  List<Todo> listTodos;

  final String baseURL = "https://gorest.co.in/public/v2/";
  Dio _dio;

  ServiceAPI(){
    _dio = Dio(BaseOptions(baseUrl: baseURL));
  }

  Future<Response> get(String endPoint) async{
    Response response = await _dio.get(endPoint);

    return response;
  }
  // Chuyển json thành list bằng dio
  // ignore: missing_return
  Future<List<User>> getListUser(String endPoint) async {

    try{
      Response response = await get(endPoint);
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
    try{
      Response response = await get(endPoint);

      if (response.statusCode == 200){
        var getPostData = response.data as List;
        listPosts = getPostData.map((i) => Post.fromJson(i)).toList();
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
    try{
      Response response = await get(endPoint);

      if (response.statusCode == 200){
        var getCommentData = response.data as List;
        listComments = getCommentData.map((i) => Comment.fromJson(i)).toList();
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
    try{
      Response response = await get(endPoint);

      if (response.statusCode == 200){
        var getTodoData = response.data as List;
        listTodos = getTodoData.map((i) => Todo.fromJson(i)).toList();
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