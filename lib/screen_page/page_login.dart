import 'package:flutter/material.dart';

class PageLoginBerhasil extends StatelessWidget {
  const PageLoginBerhasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome Admin'),
      ),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello, Selamat Datang Admin')
          ]

        ),
      ),
    );
  }
}
