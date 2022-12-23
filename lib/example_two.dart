import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/User_model.dart';
class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);



  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}
var data;
class _ExampleTwoState extends State<ExampleTwo> {

  Future<void> getUserApi() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    for(Map i in data){

    }
    if (response.statusCode == 200) {
     data = jsonDecode(response.body.toString());
    } else {

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Setup"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: ( context,  snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  } else {
                    return ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context, index) {
                             return Card(
                               child: Column(
                                 children: [
                                   ReusableRow(title: 'name', value:data[index]['name'].toString(),),
                                   ReusableRow(title: 'Username', value:data[index]['username'].toString(),),
                                   ReusableRow(title: 'address', value:data[index]['address']['street'].toString(),),
                                   ReusableRow(title: 'geo', value:data[index]['address']['geo'].toString(),),
                                   ReusableRow(title: 'lat', value:data[index]['address']['geo']['lng'].toString(),),
                                 ],
                               ),
                             );
                        }
                    );
                  }
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
