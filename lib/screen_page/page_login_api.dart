import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi2c_mobile/screen_page/page_list_berita.dart';
import 'package:mi2c_mobile/screen_page/page_register_api.dart';
import "package:http/http.dart" as http;

import '../modal/model_login.dart';
import '../utils/session_manager.dart';

class PageLoginApi extends StatefulWidget {
  const PageLoginApi({super.key});

  @override
  State<PageLoginApi> createState() => _PageLoginApiState();
}

class _PageLoginApiState extends State<PageLoginApi> {
  //Untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  //validasi form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  //Proses untuk hit API
  bool isLoading = false;

  Future<ModelLogin?> loginAccount() async {
    //handle error
    try {
      setState(() {
        isLoading = true;
      });

      http.Response response = await http
          .post(Uri.parse('http://10.127.241.233/beritaDb/login.php'), body: {
        "username": txtUsername.text,
        "password": txtPassword.text,
      });

      ModelLogin data = modelLoginFromJson(response.body);
      //Cek kondisi
      if (data.value == 1) {
        //Kondisi ketika berhasil register
        setState(() {
          isLoading = false;
          //untuk simpan sesi
          session.saveSession(
              data.value ?? 0, data.id ?? "", data.username ?? "");

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));

          //pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => PageListBerita()),
              (route) => false);
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form  Login'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                      hintText: 'Input Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtPassword,
                  obscureText: true, //biar password nya gak keliatan
                  decoration: InputDecoration(
                      hintText: 'Input Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : MaterialButton(
                            minWidth: 150,
                            height: 45,
                            onPressed: () {
                              if (keyForm.currentState?.validate() == true) {
                                loginAccount();
                              }

                              //cara get data dari text form field
                              // setState(() {
                              //   // String username = txtUsername.text;
                              //   // String pwd = txtPassword.text;
                              //   //
                              //   // print('Hasil login: ${username} dan pwd = ${pwd}');
                              // });
                            },
                            child: Text('Login'),
                            color: Colors.green,
                            textColor: Colors.white,
                          ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 1, color: Colors.green)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageRegisterApi()));
          },
          child: Text('Anda belum punya account? Silkan Register'),
        ),
      ),
    );
  }
}
