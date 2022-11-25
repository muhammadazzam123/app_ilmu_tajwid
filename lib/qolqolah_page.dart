import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class QolqolahPage extends StatelessWidget {
  const QolqolahPage({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 140,
                    decoration: BoxDecoration(
                        color: thirdColor,
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
                          Text('Qolqolah',
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
                    'Qolqolah menurut bahasa artinya bergerak dan gemetar, Sedangkan menurut istilah ialah suara tambahan atau (pantulan) yang kuat dan jelas yang terjadi pada huruf yang bersukun setelah menekan pada makhraj huruf tersebut.',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.justify,
                  )),
              const SizedBox(height: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Huruf Qolqolah : ',
                      style: nunitoTextStyle.copyWith(
                          fontSize: 15, fontWeight: extraBold),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '(ب) ba, (ج) jim, (د) dal,  (ط) tha, (ق) qaf',
                      style: nunitoTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: SizedBox(
                      height: 119,
                      child: Card(
                        elevation: 5,
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
                              height: 70,
                              width: 156,
                              child: Text(
                                "Qolqolah Kubro",
                                style: nunitoTextStyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: black,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: 36,
                              width: 112,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: thirdColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
