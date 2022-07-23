import 'package:flutter/material.dart';
import 'package:my_api_app/init.dart';
import 'package:my_api_app/models/todo.dart';
import 'package:my_api_app/screens/main_screen.dart';
import 'package:my_api_app/services/service_api.dart';


class TodoScreen extends StatefulWidget {
  const TodoScreen({ Key key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  Icon checkStatus(String status){
    if (status == "completed"){
      return const Icon(Icons.check_circle, color: Colors.green, size: 30,);
    }
    return const Icon(Icons.pending, color: Colors.red, size: 30,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TodoIcon,
        backgroundColor: TodoColor,
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
                child: FutureBuilder<List<Todo>>(
                  // future: ServiceAPI().listUsers,
                  future: ServiceAPI().getListTodo("todos"),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index){
                          var todo = (snapshot.data)[index];
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
                            margin: const EdgeInsets.only(top: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(todo.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                                ),
                                const SizedBox(width: 30,),
                                checkStatus(todo.status),
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