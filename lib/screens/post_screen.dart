import 'package:flutter/material.dart';
import 'package:my_api_app/init.dart';
import 'package:my_api_app/models/post.dart';
import 'package:my_api_app/screens/main_screen.dart';
import 'package:my_api_app/services/service_api.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({ Key key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts", style: TextStyle(color: Colors.black),),
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
                  // future: ServiceAPI().listUsers,
                  future: ServiceAPI().getListPost("https://gorest.co.in/public/v2/posts"),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index){
                          var post = (snapshot.data)[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(post.userId.toString(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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