import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/model_latihan_pegawai.dart';

class PageUpdatePegawai extends StatefulWidget {
  final Datum data;
  //const PageUpdatePegawai({super.key});
  const PageUpdatePegawai({Key? key, required this.data}) : super(key: key);

  @override
  State<PageUpdatePegawai> createState() => _PageUpdatePegawaiState();
}

class _PageUpdatePegawaiState extends State<PageUpdatePegawai> {
  late TextEditingController txtNama;
  late TextEditingController txtNobp;
  late TextEditingController txtNohp;
  late TextEditingController txtEmail ;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    txtNama = TextEditingController(text: widget.data.nama);
    txtEmail = TextEditingController(text: widget.data.email);
    txtNobp = TextEditingController(text: widget.data.nobp);
    txtNohp = TextEditingController(text: widget.data.nohp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form Update Pegawai'),
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
                    controller: txtNama,
                    //initialValue: widget.data?.nama ?? "",
                    decoration: InputDecoration(
                        hintText: 'Nama',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: txtNobp,
                    decoration: InputDecoration(
                        hintText: 'NOBP',
                        prefixIcon: Icon(Icons.format_list_numbered_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: txtNohp,
                    decoration: InputDecoration(
                        hintText: 'No HP',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: txtEmail,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (keyForm.currentState?.validate() == true) {
                        // Kirim data perubahan ke server
                        http.post(
                          Uri.parse('http://192.168.43.45/edukasi_server/updatePegawai.php'),
                          body: {
                            'id': widget.data.id.toString(),
                            'nama': txtNama.text,
                            'nobp': txtNobp.text,
                            'email': txtEmail.text,
                            'nohp': txtNohp.text,
                          },
                        ).then((response) {
                          if (response.statusCode == 200) {
                            var jsonResponse = json.decode(response.body);
                            if (jsonResponse['is_success'] == true) {
                              // Jika pembaruan berhasil, kembalikan data yang diperbarui ke halaman sebelumnya
                              Datum updatedData = Datum(
                                id: widget.data.id,
                                nama: txtNama.text,
                                nobp: txtNobp.text,
                                email: txtEmail.text,
                                nohp: txtNohp.text,
                                tanggalInput: widget.data.tanggalInput,
                              );
                              Navigator.pop(context, updatedData);
                            } else {
                              // Jika pembaruan gagal, tampilkan pesan kesalahan
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Gagal"),
                                    content: Text("Terjadi kesalahan: ${jsonResponse['message']}"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            // Jika respons server tidak berhasil, tampilkan pesan kesalahan umum
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Gagal"),
                                  content: Text("Terjadi kesalahan saat mengirim data ke server"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }).catchError((error) {
                          // Tangani kesalahan koneksi atau lainnya
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Gagal"),
                                content: Text("Terjadi kesalahan: $error"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      }
                    },
                    child: const Text("SIMPAN"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
