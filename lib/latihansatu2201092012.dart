import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PageLatihan extends StatelessWidget {
  const PageLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/politeknik.png',
                fit: BoxFit.contain,
                height: 200,
                width: 200,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Selamat Datang di Politeknik Negeri Padang",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.orange,
                ),
              ),
              Text("Limau Manih, Padang Sumbar"),
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                onPressed: () {
                  showToast(
                    'Manajemen Informatika',
                    context: context,
                    axis: Axis.horizontal,
                    alignment: Alignment.center,
                    position: StyledToastPosition.bottom,
                    borderRadius: BorderRadius.zero,
                    toastHorizontalMargin: 0,
                    fullWidth: true,
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageInformatika()));
                },
                child: Text(
                  'Manajemen Infromatika',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                minWidth: 230,
                height: 40,
                color: Colors.orange,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  showToast('Teknik Komputer',
                      context: context,
                      animation: StyledToastAnimation.slideFromTop,
                      reverseAnimation: StyledToastAnimation.slideToTop,
                      position: StyledToastPosition.top,
                      startOffset: Offset(0.0, -3.0),
                      reverseEndOffset: Offset(0.0, -3.0),
                      duration: Duration(seconds: 4),
                      //Animation duration   animDuration * 2 <= duration
                      animDuration: Duration(seconds: 1),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.fastOutSlowIn);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageKomputer()));
                },
                child: Text(
                  'Teknik Komputer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                minWidth: 230,
                height: 40,
                color: Colors.orange,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PageInformatika extends StatelessWidget {
  const PageInformatika({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Manajemen Informatika',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Deskripsi dan Profil',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Program Studi Manajemen Informatika (Kampus Kab. Pelalawan) merupakan salah satu Program Studi Diluar Kampus Utama (PSDKU) Politeknik Negeri Padang yang memiliki sejarah dan keterkaitan erat dengan berdirinya Akademi Komunitas di Daerah Pelalawan. Berangkat dari SK Pendirian Akademi Komunitas Nomor : 179/P/2013 Tanggal 26 September 2013, Program Studi Diluar Domisili (PDD) Kabupaten Pelalawan di awal berdirinya memiliki Program Studi D2 Elektro Industri dan D2 Manajemen Informatika.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
                color: Colors.orange,
                textColor: Colors.white,
              )
            ],
          ),
        ));
  }
}

class PageKomputer extends StatelessWidget {
  const PageKomputer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Teknik Komputer',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Deskripsi',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Program Studi Manajemen Informatika (Kampus Kab. Pelalawan) merupakan salah satu Program Studi Diluar Kampus Utama (PSDKU) Politeknik Negeri Padang yang memiliki sejarah dan keterkaitan erat dengan berdirinya Akademi Komunitas di Daerah Pelalawan. Berangkat dari SK Pendirian Akademi Komunitas Nomor : 179/P/2013 Tanggal 26 September 2013, Program Studi Diluar Domisili (PDD) Kabupaten Pelalawan di awal berdirinya memiliki Program Studi D2 Elektro Industri dan D2 Manajemen Informatika.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
                color: Colors.orange,
                textColor: Colors.white,
              )
            ],
          ),
        ));
  }
}
