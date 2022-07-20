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
        title: UserIcon,
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: FutureBuilder<List<User>>(
                  // future: ServiceAPI().listUsers,
                  future: ServiceAPI().getListUser("users"),
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
                            decoration: BoxDecoration(
                              color: UserColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  blurRadius: 3,
                                  offset: const Offset(0, 2), // changes position of shadow
                                ),
                              ]
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            
                            child: Row(children: [
                              const SizedBox(width: 10, height: 10,),
                              const Icon(Icons.supervisor_account_outlined, size: 40,),
                              const SizedBox(width: 20, height: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  Row(children: [
                                    const Icon(Icons.mail, size: 22,),
                                    const SizedBox(width: 5, height: 30,),
                                    Text(user.email, style: const TextStyle(fontSize: 13),),
                                  ],),
                                  Row(children: [
                                    const Icon(Icons.transgender, size: 22,),
                                    const SizedBox(width: 5, height: 10,),
                                    Text(user.gender.toString(), style: const TextStyle(fontSize: 13),),
                                  ],),
                                  Row(children: [
                                    const Icon(Icons.verified_user, size: 22,),
                                    const SizedBox(width: 5, height: 10,),
                                    Text(user.status.toString(), style: const TextStyle(fontSize: 13),),
                                  ],),
                                ],
                              )
                              ]
                            ),
                          );
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