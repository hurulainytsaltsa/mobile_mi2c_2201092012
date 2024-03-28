import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:mi2c_mobile/screen_page/page_bottom_navigation.dart';
import 'package:mi2c_mobile/screen_page/page_list_berita.dart';
import 'package:mi2c_mobile/screen_page/page_list_user.dart';
import 'package:mi2c_mobile/screen_page/page_navigator.dart';
import 'package:mi2c_mobile/screen_page/page_search_list.dart';

class PageBeranda extends StatelessWidget {
  const PageBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Project MI 2C'),
        centerTitle: true,
      ),
      body: Center(
        //biar bisa scroll kalau widgetnya panjang ke bawah
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/spongebob.webp',
                fit: BoxFit.contain,
                height: 200,
                width: 200,
              ),
              SizedBox(height: 8),
              const Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                fit: BoxFit.contain,
                height: 200,
                width: 200,
              ),
              Text('Program Studi: Manajemen Informatika 2C'),
              Text('Kampus Politeknik Negeri Padang'),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  //tambahkan code toast
                  showToast('Pindah Ke Page Navigator',
                      context: context,
                      axis: Axis.horizontal,
                      alignment: Alignment.center,
                      position: StyledToastPosition.bottom,
                      toastHorizontalMargin: 20,
                      fullWidth: true);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageNavigatorBar()));
                },
                child: Text(
                  'Page Navigator Utama',
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
                  //tambahkan code toast
                  showToast(
                    'This is normal toast with animation',
                    context: context,
                    animation: StyledToastAnimation.slideFromBottomFade,
                    reverseAnimation: StyledToastAnimation.slideToTopFade,
                    position: StyledToastPosition(
                        align: Alignment.topCenter, offset: 0.0),
                    startOffset: Offset(0.0, -3.0),
                    reverseEndOffset: Offset(0.0, -3.0),
                    duration: Duration(seconds: 4),
                    animDuration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    reverseCurve: Curves.fastOutSlowIn,
                  );
                },
                child: Text(
                  'Toast Atas',
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("ini adalah pesan snackbar"),
                      backgroundColor: Colors.orange,
                    ),
                  );
                },
                child: Text(
                  'Snackbar',
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
                          builder: (context) => PageBottomNavigationBar()));
                },
                child: Text(
                  'Bottom Navigation Bar',
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
                          builder: (context) => PageListUser()));
                },
                child: Text(
                  'Page List User',
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
                          builder: (context) => PageListBerita()));
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

class PageListHorizontal extends StatelessWidget {
  const PageListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('List Horizontal'),
      ),
      body: SizedBox(
        height: 200,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(50, (index) {
              return Card(
                child: Center(child: Text('Horizontal ke : ${index}')),
              );
            })),
      ),
    );
  }
}
