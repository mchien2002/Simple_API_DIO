import 'package:flutter/material.dart';
import 'package:my_api_app/init.dart';
import 'package:my_api_app/screens/main_screen.dart';
import 'package:my_api_app/services/service_api.dart';
import '../models/user.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({ Key key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users", style: TextStyle(color: Colors.black),),
        backgroundColor: UserColor,
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
                child: FutureBuilder<List<User>>(
                  // future: ServiceAPI().listUsers,
                  future: ServiceAPI().getListUser("https://gorest.co.in/public/v2/users"),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index){
                          var user = (snapshot.data)[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                Text(user.email, style: const TextStyle(fontSize: 12),),
                                Text(user.gender.toString(), style: const TextStyle(fontSize: 12),),
                                Text(user.status.toString(), style: const TextStyle(fontSize: 12),),
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