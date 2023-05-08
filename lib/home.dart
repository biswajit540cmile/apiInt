

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'api/apiresponse.dart';


// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  final List<User> user;
  const homeScreen({super.key, required this.user});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('TEST'),leading: Container(
            child: MaterialButton(onPressed: () => getData(),child: const Text('API'),)
          ),),
    body: ListView.builder(itemCount: widget.user.length,itemBuilder:(context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Text(widget.user[index].id,style: TextStyle(fontSize: 5,fontStyle: FontStyle.italic),),
                title: Text(widget.user[index].userId),
                subtitle: Text(widget.user[index].title),
                trailing: Text(widget.user[index].completed),
              ),
            );
               } ),
    );
  }
}