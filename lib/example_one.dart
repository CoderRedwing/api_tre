import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/models/User_model.dart';
import 'package:http/http.dart' as http;
class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
  final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data =jsonDecode(resposne.body.toString());
  if(resposne.statusCode==200){
    for(Map i in data){
      print(i['name']);
      userList.add(UserModel.fromJson(i));
    }
  return userList;
  }else{
     return userList;
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title:  const Text("API Course"),
        ),
            body: Column(
        children: [
          Expanded(
              child: FutureBuilder(

               future: getUserApi(),
                  builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
              if(!snapshot.hasData){
                return const CircularProgressIndicator(

                  strokeWidth: 5,
                    backgroundColor: Colors.cyanAccent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red)

                );
              }else{}
              return ListView.builder(
                itemCount: userList.length,
                  itemBuilder: (context,index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ReusableRow(title: 'name', value: snapshot.data![index].name.toString()),
                        ReusableRow(title: 'username', value: snapshot.data![index].username.toString()),
                        ReusableRow(title: 'email', value: snapshot.data![index].email.toString()),
                        ReusableRow(title: 'Address',
                            value: snapshot.data![index].address!.city.toString()
                        ),
                      ],

                    ),
                  ),
                );
                  });
                  }

       ),
          )
      ],
    ),
    );
  }
}
class ReusableRow extends StatelessWidget {
   final String title,value;
   const ReusableRow({Key? key ,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(title),
          Text(value),
        ],
      ),
    );
  }
}
