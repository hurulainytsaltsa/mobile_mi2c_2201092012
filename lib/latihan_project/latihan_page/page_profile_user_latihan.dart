import 'package:flutter/material.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_edit_profile_latihan.dart';

import '../utils/session_manager_latihan.dart';

class PageProfileUser extends StatefulWidget {
  const PageProfileUser({super.key});

  @override
  State<PageProfileUser> createState() => _PageProfileUserState();
}

class _PageProfileUserState extends State<PageProfileUser> {
  String? userName, name, email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataSession();
  }

  //untuk mendapatkan sesi
  Future getDataSession() async{
    await Future.delayed(const Duration(seconds: 5),(){
      session.getSession().then((value){
        print('Data sesi ..'+ value.toString());
        userName = session.userName;
        name = session.Nama;
        email = session.email;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 55,
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 65,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('${session.Nama}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey[300],
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text('Username : ${session.userName}'),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email : ${session.email}'),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8),
                      Text('No HP : ${session.nohp}'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
