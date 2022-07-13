import 'package:app_ilmu_tajwid/models/models_mim.dart';
import 'package:app_ilmu_tajwid/pages/widgets/menu_mim.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MimPage extends StatelessWidget {
  const MimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference mims = firestore.collection('mims');
    return Scaffold(
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
                      color: fourthColor,
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
                        Text('Mim Sukun',
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
            const SizedBox(height: 20),
            StreamBuilder<QuerySnapshot>(
              stream: mims.orderBy('id', descending: false).snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      // ignore: unnecessary_cast
                      children: (snapshot.data! as QuerySnapshot)
                          .docs
                          .map(
                            (e) => MenuMim(
                              MimSukun(
                                id: e['id'],
                                name: e['name'],
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
    );
  }
}
