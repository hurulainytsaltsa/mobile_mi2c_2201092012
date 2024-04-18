import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mi2c_mobile/latihan_page/page_detail_berita_latihan.dart';
import 'package:mi2c_mobile/latihan_page/page_login_api_latihan.dart';
import '../modal/model_latihan_berita.dart';
import '../utils/session_manager_latihan.dart';

class PageListLatihanBerita extends StatefulWidget {
  const PageListLatihanBerita({super.key});

  @override
  State<PageListLatihanBerita> createState() => _PageListLatihanBeritaState();
}

class _PageListLatihanBeritaState extends State<PageListLatihanBerita> {
  String? userName;
  TextEditingController searchController = TextEditingController();
  List<Datum>? beritaList;
  List<Datum>? filteredBeritaList;

  //untuk mendapatkan sesi
  Future getDataSession() async{
    await Future.delayed(const Duration(seconds: 5),(){
      session.getSession().then((value){
        print('Data sesi ..'+ value.toString());
        userName = session.userName;
      });
    });
  }
  //method untuk get berita
  Future<List<Datum>?> getBerita() async {
    try {
      //berhasil
      http.Response response = await http
          .get(Uri.parse('http://192.168.43.45/edukasi_server/getBerita.php'));

      return modelLatihanBeritaFromJson(response.body).data;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session.getSession();
    getDataSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Berita'),
        backgroundColor: Colors.cyan,
        actions: [
          TextButton(onPressed: (){}, child: Text('Hi .. ${session.userName}')),
          //logout
          IconButton(onPressed: (){
            setState(() {
              session.clearSession();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PageLoginApiLatihan()), (route) => false);
            });
          },
            icon: Icon(Icons.exit_to_app), tooltip: 'Logout',)
        ],
      ),

      body:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  filteredBeritaList = beritaList
                      ?.where((element) =>
                  element.judul!
                      .toLowerCase()
                      .contains(value.toLowerCase()) ||
                      element.berita!
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),),
          Expanded(child:FutureBuilder(
              future: getBerita(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
                if (snapshot.hasData) {
                  beritaList = snapshot.data;
                  if (filteredBeritaList == null) {
                    filteredBeritaList = beritaList;
                  }
                  return ListView.builder(
                      itemCount: filteredBeritaList!.length,
                      //itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        Datum data = filteredBeritaList![index];
                        //Datum? data = snapshot.data?[index];
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              //Ini untuk ke detail
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailBerita(data)));
                            },
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'http://192.168.43.45/edukasi_server/gambar_berita/${data?.gambar}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      '${data?.judul}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                          fontSize: 18),
                                    ),
                                    subtitle: Text(
                                      "${data?.berita}",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                }
              }),)
        ],
      ),
    );
  }
}
