import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future getData() async {
  // ignore: prefer_typing_uninitialized_variables
  var responseJs;
   Map<String, dynamic> user = {};
  final url = 'https://jsonplaceholder.typicode.com/todos/10';

  //final response = await http.get(Uri.parse(url));
  await http.get(Uri.parse(url)).then((response) {
    responseJs = response;
  }).catchError((onError) {
    print("--GET onError $url  $onError ");
    return onError;
  });


  if(responseJs.statusCode == 200){
    user = jsonDecode(responseJs.body);

  }
//return data;
 print(user);
  
  
}

class User{
final String userId;
final String id;
final String title;
final String completed;


  User({ required this.userId,required this.id,required this.title,required this.completed});

  factory User.getData(Map<String, dynamic> user) {
    return User(
      userId: user['userId'],
      title: user['title'], 
      completed: user['completed'],
       id: user['id'],
    );
  }


}



