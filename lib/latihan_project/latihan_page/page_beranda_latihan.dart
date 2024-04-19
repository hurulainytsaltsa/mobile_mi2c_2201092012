import 'package:flutter/material.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_list_berita_latihan.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_login_api_latihan.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_register_api_latihan.dart';

class PageBerandaLatihan extends StatelessWidget {
  const PageBerandaLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Latihan Mobile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/logo.png',
                fit: BoxFit.contain,
                height: 200,
                width: 200,
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageRegisterApiLatihan()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageLoginApiLatihan()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageListLatihanBerita()));
                },
                child: Text(
                  'Berita',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
