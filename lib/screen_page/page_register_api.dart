import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi2c_mobile/screen_page/page_login_api.dart';
import "package:http/http.dart" as http;

import '../model/model_register.dart';

class PageRegisterApi extends StatefulWidget {
  const PageRegisterApi({super.key});

  @override
  State<PageRegisterApi> createState() => _PageRegisterApiState();
}

class _PageRegisterApiState extends State<PageRegisterApi> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  //validasi form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  //Proses untuk hit API
  bool isLoading = false;

  Future<ModelRegister?> registerAccount() async {
    //handle error
    try {
      setState(() {
        isLoading = true;
      });

      http.Response response = await http.post(
          Uri.parse('http://10.126.250.198/beritaDb/register.php'),
          body: {
            "username": txtUsername.text,
            "password": txtPassword.text,
            "fullname": txtFullName.text,
            "email": txtEmail.text
          }
      );

      ModelRegister data = modelRegisterFromJson(response.body);
      //Cek kondisi
      if (data.value == 1) {
        //Kondisi ketika berhasil register
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}'))
          );

          //pindah ke page login
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => PageLoginApi()
          ), (route) => false);
        });
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}'))
          );
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}'))
          );
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Form Register'),
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
                  return val!.isEmpty ? "Tidak boleh kosong" : null;
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
              TextFormField(
                //validasi kosong
                validator: (val) {
                  return val!.isEmpty ? "Tidak boleh kosong" : null;
                },
                controller: txtFullName,
                decoration: InputDecoration(
                    hintText: 'Input Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                //validasi kosong
                validator: (val) {
                  return val!.isEmpty ? "Tidak boleh kosong" : null;
                },
                controller: txtEmail,
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                //validasi kosong
                validator: (val) {
                  return val!.isEmpty ? "Tidak boleh kosong" : null;
                },
                controller: txtPassword,
                obscureText: true, //biar password tidak kelihatan
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),

              SizedBox(
                height: 15,
              ),
              //Proses cek loading
              Center(child: isLoading ? Center(
                child: CircularProgressIndicator(),
              ) : MaterialButton(onPressed: () {
                //Cek validasi form ada kosong atau tidak
                if (keyForm.currentState?.validate() == true) {
                  setState(() {
                    registerAccount();
                  });
                }
              },
                child: Text('Register'),
                color: Colors.green,
                textColor: Colors.white,
              )),
                ],
              ),
            ),
          )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 1, color: Colors.green)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PageLoginApi()
            ));
          },
          child: Text('Anda sudah punya account? Silahkan Login'),
        ),
      ),
    );
  }
}
