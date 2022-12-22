import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

    class _ExampleState extends State<Example> {
  List<Photos> photoList = [];
  Future<List<Photos>> getPhotos () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data =jsonDecode(response.body.toString());
    for(Map i in data){
      Photos photos= Photos(title: i['title'], url: i['url'], id: i['id']);
      photoList.add(photos);
    }
    if(response.statusCode==200){
     return photoList;
    }else{
      return photoList;
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
           future: getPhotos(),
             builder:  (context, AsyncSnapshot<List<Photos>> snapshot){
           return ListView.builder(
             itemCount: photoList.length,
               itemBuilder: (context ,index){
            return  ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
              ),
              subtitle: Text(snapshot.data![index].title.toString()),
              title: Text('Notes id${snapshot.data![index].id}'),
            );
           });
    }),
       )
        ],
      ),
    );
  }
}
class Photos{
  String title ,url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}