import 'package:app_ilmu_tajwid/animation.dart';
import 'package:app_ilmu_tajwid/pages/detail_mim.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MimPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  MimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            FadeAnimation(
              1,
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
            ),
            const SizedBox(height: 20),
            FadeAnimation(
              1.3,
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection("data_mim").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Text(
                      "Data Pengguna Kosong",
                      style: TextStyle(fontSize: 30),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final mims = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: SizedBox(
                          height: 119,
                          child: Card(
                            elevation: 3,
                            color: const Color(0xffFAFAFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(height: 25),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 66,
                                  width: 156,
                                  child: Text(
                                    mims["name"],
                                    style: nunitoTextStyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 36,
                                  width: 112,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: fourthColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailMim(
                                                    name: mims["name"],
                                                    pengertian:
                                                        mims["pengertian"],
                                                    huruf: mims["huruf"],
                                                    caraMembaca:
                                                        mims["caraMembaca"],
                                                    suara: mims["suara"],
                                                    gambar: mims["gambar"],
                                                    deskripsi:
                                                        mims["deskripsi"],
                                                  )));
                                    },
                                    child: Text(
                                      'Lanjutkan',
                                      style: nunitoTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: bold,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
