// import 'package:app_ilmu_tajwid/animation.dart';
import 'package:app_ilmu_tajwid/pages/makhorijul_page.dart';
import 'package:app_ilmu_tajwid/pages/mim_page.dart';
import 'package:app_ilmu_tajwid/pages/nun_page.dart';
import 'package:app_ilmu_tajwid/pages/qolqolah_page.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Stack(
        children: [
          Container(
            height: 256,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Container(
              margin: const EdgeInsets.only(top: 59, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FadeAnimation(
                  //   1,
                  Text(
                    'Yuk Belajar',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 40, color: whiteColor, fontWeight: black),
                  ),
                  // ),
                  // FadeAnimation(
                  //   1.1,
                  Text(
                    'Tajwid...',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 40, color: whiteColor, fontWeight: black),
                  ),
                  // ),
                ],
              ),
            ),
          ),
          // FadeAnimation(
          //   1.2,
          Image.asset(
            'assets/Vector 1.png',
            height: 157,
          ),
          // ),
          // FadeAnimation(
          //   1.2,
          Container(
            margin: const EdgeInsets.only(top: 99),
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/Vector 2.png',
              height: 157,
            ),
          ),
          // ),
          // FadeAnimation(
          //   1.3,
          Container(
            margin: const EdgeInsets.only(top: 56),
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/Ikhwanngaji.png',
              height: 200,
            ),
          ),
          // ),
        ],
      );
    }

    Widget body() {
      return GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 150,
        ),
        children: [
          InkWell(
            child: GridContainer(
                secondaryColor,
                Image.asset('assets/nun.png', width: 60),
                'Hukum Nun Sukun/Tanwin'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NunPage()));
            },
          ),
          InkWell(
            child: GridContainer(primaryColor,
                Image.asset('assets/fa.png', width: 60), 'Makhorijul Huruf'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MakharijulPage()));
            },
          ),
          InkWell(
            child: GridContainer(thirdColor,
                Image.asset('assets/qof.png', width: 60), 'Hukum Qolqolah'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QolqolahPage()));
            },
          ),
          InkWell(
            child: GridContainer(fourthColor,
                Image.asset('assets/mim.png', width: 60), 'Hukum Mim Sukun'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MimPage()));
            },
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            header(),
            body(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  final Color color;
  final Image image;
  final String titleText;

  const GridContainer(this.color, this.image, this.titleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FadeAnimation(
            //   1.4,
            image,
            // ),
            const SizedBox(height: 10),
            // FadeAnimation(
            //   1.5,
            SizedBox(
              width: 103,
              child: Text(
                titleText,
                style: nunitoTextStyle.copyWith(
                    color: whiteColor, fontWeight: bold, fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
