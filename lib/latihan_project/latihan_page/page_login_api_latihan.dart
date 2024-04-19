import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:mi2c_mobile/latihan_project/latihan_page/page_bottom_navigation_latihan.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_register_api_latihan.dart';

import '../model/model_latihan_login.dart';
import '../utils/session_manager_latihan.dart';

class PageLoginApiLatihan extends StatefulWidget {
  const PageLoginApiLatihan({super.key});

  @override
  State<PageLoginApiLatihan> createState() => _PageLoginApiLatihanState();
}

class _PageLoginApiLatihanState extends State<PageLoginApiLatihan> {
  //Untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  //validasi form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  //Proses untuk hit API
  bool isLoading = false;

  Future<ModelLatihanLogin?> loginAccount() async {
    //handle error
    try {
      setState(() {
        isLoading = true;
      });

      http.Response response = await http.post(
          Uri.parse('http://192.168.43.45/edukasi_server/login.php'),
          body: {
            "username": txtUsername.text,
            "password": txtPassword.text,
          });

      ModelLatihanLogin data = modelLatihanLoginFromJson(response.body);

      //Cek kondisi
      if (data.value == 1) {
        //Kondisi ketika berhasil register
        setState(() {
          isLoading = false;
          //untuk simpan sesi
          session.saveSession(
              data.value ?? 0, data.id ?? "", data.username ?? "", data.nama ?? "", data.email ?? "", data.nohp ?? "");

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));

          //pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => PageBottomNavigationLatihan()),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'gambar/logo_ti.png',
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.supervised_user_circle),
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
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.key),
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
                            },
                            child: Text('Login'),
                            color: Colors.cyan,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    width: 1, color: Colors.blueGrey)),
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
              side: const BorderSide(width: 1, color: Colors.blueGrey)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageRegisterApiLatihan()));
          },
          child: Text('Anda belum punya account? Silahkan Register'),
        ),
      ),
    );
  }
}
