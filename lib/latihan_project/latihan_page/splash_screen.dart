import 'package:flutter/material.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_login_api_latihan.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageSplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white38,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('gambar/logo_pnp.png',
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,),
                SizedBox(height: 8),
                Text('Politeknik Negeri Padang',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Limau Manis, Kec. Pauh, Kota Padang, Sumatera Barat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,)
                )
              ]
          )
      ),
    );
  }
}



class PageSplashScreen extends StatefulWidget {
  const PageSplashScreen({super.key});

  @override
  State<PageSplashScreen> createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PageLoginApiLatihan()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white38,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('gambar/logo_ti.png',
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,),
                SizedBox(height: 8),
                Text('Jurusan Teknologi Informasi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Prodi Manajemen Informatika',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
          )
      ),
    );

  }
}

