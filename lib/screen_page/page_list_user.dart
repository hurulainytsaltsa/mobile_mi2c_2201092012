import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mi2c_mobile/model/model_user.dart';
import 'package:http/http.dart' as http;

import '../model/model_user.dart';
class PageListUser extends StatefulWidget {
  const PageListUser({super.key});

  @override
  State<PageListUser> createState() => _PageListUserState();
}

class _PageListUserState extends State<PageListUser> {
  bool isLoading = false;
  List<ModelUsers> listUser = [];


  //method untuk get data dari api
  Future getUsers() async{
    try{
      setState(() {
        isLoading = true;
      });
      http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      var data = jsonDecode(response.body);
      setState(() {
        for(Map<String, dynamic> i in data){
          listUser.add(ModelUsers.fromJson(i));
        }
      });
    }catch(e){
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('List User API'),
      ),
      body: ListView.builder(
          itemCount: listUser.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  title: Text(
                    listUser[index].name ?? "",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email :  ${listUser[index].email}" ?? ""),
                      Text("Address City :  ${listUser[index].address.city}" ?? ""),
                      Text("Company :  ${listUser[index].company.name}" ?? ""),
                    ],
                  ),
                ),
              ),);
          }),
    );
  }
}