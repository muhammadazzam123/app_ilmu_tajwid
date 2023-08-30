// import 'package:app_ilmu_tajwid/animation.dart';
import 'package:app_ilmu_tajwid/pages/detail_makhroj.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MakharijulPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  MakharijulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // FadeAnimation(
              //   1,
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 140,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20, top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Makhorijul',
                            style: nunitoTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: black),
                          ),
                          Text('Huruf',
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
              // ),
              const SizedBox(height: 17),
              // FadeAnimation(
              //   1.3,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Menurut bahasa tempat keluar sedangkan menurut istilah suatu nama tempat yang pada tempat tersebut huruf dibentuk (atau diucapkan). Dengan demikian, makhraj huruf adalah tempat keluarnya huruf pada waktu huruf tersebut dibunyikan.',
                  style: nunitoTextStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
              ),
              // ),
              const SizedBox(height: 22),
              // FadeAnimation(
              //   1.5,
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembagian Makhraj Huruf',
                      style: nunitoTextStyle.copyWith(
                          fontSize: 18, fontWeight: extraBold),
                    ),
                    Text(
                      'Menurut Imam Ibnul Jazari, makharijul huruf itu dibagi menjadi 17 (tujuh belas), ketujuh belas makhraj tersebut berada pada 5 (lima) tempat, berikut ini ke lima tempat tersebut :',
                      style: nunitoTextStyle.copyWith(
                          fontSize: 15, fontWeight: medium),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              // ),
              const SizedBox(height: 30),
              // FadeAnimation(
              //   1.7,
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection("data_makhroj").snapshots(),
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
                      final makhrojs = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: 180,
                                      child: Text(
                                        makhrojs["name"],
                                        style: nunitoTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailMakhroj(
                                              name: makhrojs["name"],
                                              gambar: makhrojs["gambar"],
                                              huruf: makhrojs["huruf"],
                                              suara: makhrojs["suara"],
                                            ),
                                          ),
                                        );
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
                                  ],
                                ),
                                Image.network(makhrojs["gambar"], height: 95)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
