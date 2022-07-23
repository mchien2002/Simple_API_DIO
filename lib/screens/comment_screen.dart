import 'package:flutter/material.dart';
import 'package:my_api_app/init.dart';
import 'package:my_api_app/models/comment.dart';
import 'package:my_api_app/screens/main_screen.dart';
import 'package:my_api_app/services/service_api.dart';


class CommentsScreen extends StatefulWidget {
  const CommentsScreen({ Key key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommentIcon,
        backgroundColor: CommentColor,
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
                child: FutureBuilder<List<Comment>>(
                  // future: ServiceAPI().listUsers,
                  future: ServiceAPI().getListComment("comments"),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index){
                          var comment = (snapshot.data)[index];
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
                            margin: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(Icons.person, size: 40, color: CommentColor,),
                                    const SizedBox(width: 5,),
                                    Text(comment.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 45, top: 10, bottom: 5),
                                  child: Text(comment.body, style: const TextStyle(fontSize: 13),)
                                ),
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