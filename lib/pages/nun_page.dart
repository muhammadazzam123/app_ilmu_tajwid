import 'package:app_ilmu_tajwid/models/models_nun.dart';
import 'package:app_ilmu_tajwid/pages/widgets/menu_nun.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NunPage extends StatelessWidget {
  const NunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference posts = firestore.collection('posts');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 140,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hukum',
                            style: nunitoTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: black),
                          ),
                          Text('Nun Sukun/Tanwin',
                              style: nunitoTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: black))
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Image.asset('assets/Vector 3.png', height: 70)),
                  Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(right: 20, top: 70),
                      child: Image.asset('assets/Vector 4.png', height: 70)),
                ],
              ),
              const SizedBox(height: 17),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Nun bersukun adalah huruf nun yang bertanda sukun (ن). Nun bersukun dikenal pula dengan sebutan "nun mati" sedangkan menurut istilah ialah : Nun bersukun yang bertemu dengan akhir isim yang tampak dalam bentuk suara dan ketika washal, tidak dalam penulisan dan pada saat waqaf',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.justify,
                  )),
              const SizedBox(height: 20),
              StreamBuilder<QuerySnapshot>(
                stream: posts.orderBy('id', descending: false).snapshots(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        // ignore: unnecessary_cast
                        children: (snapshot.data! as QuerySnapshot)
                            .docs
                            .map(
                              (e) => MenuNun(
                                NunSukun(
                                  id: e['id'],
                                  name: e['name'],
                                  bahasaIstilah: e['bahasaIstilah'],
                                  pengertian: e['pengertian'],
                                  huruf: e['huruf'],
                                  caraMembaca: e['caraMembaca'],
                                  gambar: e['gambar'],
                                  audio: e['audio'],
                                  deskripsi: e['deskripsi'],
                                ),
                              ),
                            )
                            .toList());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
