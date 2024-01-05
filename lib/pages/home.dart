import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/detail_page.dart';
import 'package:tugas_akhir/pages/makanan.dart';
import 'package:tugas_akhir/pages/style.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference produk =
        FirebaseFirestore.instance.collection('produk');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Kulineran',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              child: Text(
                "Pilih Menu",
                style: header2,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: produk.orderBy('nama', descending: false).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  List<Makanan> makananList = snapshot.data!.docs.map((doc) {
                    return Makanan(
                      doc['nama'],
                      doc['harga'],
                      gambar: doc['gambar'],
                      deskripsi: doc['deskripsi'],
                    );
                  }).toList();

                  return ListView.builder(
                    itemCount: makananList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/${makananList[index].gambar}",
                              width: 200,
                              height: 150,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    makananList[index].nama,
                                    style: header3,
                                  ),
                                  SizedBox(height: 10),
                                  Text("Rp ${makananList[index].harga}"),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            Makanan(
                                              makananList[index].nama,
                                              makananList[index].harga,
                                              deskripsi:
                                                  makananList[index].deskripsi,
                                              gambar: makananList[index].gambar,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Lihat Detail",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
