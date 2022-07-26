import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_api_app/init.dart';
import 'package:my_api_app/models/post.dart';
import 'package:my_api_app/models/user.dart';
import 'package:my_api_app/screens/main_screen.dart';
import 'package:my_api_app/services/service_api.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({ Key key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen>{
  // ignore: non_constant_identifier_names
  List<User> ListUsers;

  void getListUsers() async{
    Response response = await ServiceAPI().get("users");

    setState(() {
      var getUserData = response.data as List;
      var listUsers = getUserData.map((i) => User.fromJson(i)).toList();
      ListUsers = listUsers;
    });
  }

  // ignore: missing_return
  String getUserName (int id, List<User> users){
    if (users != null){
      for (User item in users){
        if (id == item.id){
          return item.name;
        }
      }
      return "Unknown";
    }
  }

  @override
  void initState(){
    ServiceAPI();
    getListUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PostIcon,
        backgroundColor: PostColor,
        bottomOpacity: 0.0,
        elevation: 0.0,      
        leading: IconButton(icon: const Icon(Icons.arrow_back), color: Colors.black, onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen())
          );
        },),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 20,
              ),

              Expanded(
                child: FutureBuilder<List<Post>>(
                  future: ServiceAPI().getListPost("posts"),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index){
                          // getListUsers();
                          var post = (snapshot.data)[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [  
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.9),
                                  blurRadius: 3,
                                  offset: const Offset(0, 2), // changes position of shadow
                                ),
                              ]
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(Icons.person, color: PostColor,),
                                    const SizedBox(width: 5,),
                                    Text(getUserName(post.userId, ListUsers), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text(post.title, style: const TextStyle(fontSize: 12),),
                                Text(post.body.toString(), style: const TextStyle(fontSize: 12),),
                              ],
                            ));
                        },
                      );
                    }
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}