import 'package:app_ilmu_tajwid/animation.dart';
import 'package:app_ilmu_tajwid/navbar.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class DetailHasil extends StatefulWidget {
  final int score;
  const DetailHasil(this.score, {Key? key}) : super(key: key);

  @override
  State<DetailHasil> createState() => _DetailHasilState();
}

class _DetailHasilState extends State<DetailHasil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeAnimation(
                1,
                Text(
                  'Alhamdulillah',
                  style: nunitoTextStyle.copyWith(
                      fontSize: 34, fontWeight: extraBold),
                ),
              ),
              const SizedBox(height: 20),
              FadeAnimation(
                1.3,
                Text(
                  'Kamu Mendapatkan Nilai :',
                  style: nunitoTextStyle.copyWith(
                      fontSize: 15, fontWeight: medium),
                ),
              ),
              const SizedBox(height: 50),
              FadeAnimation(
                1.5,
                Text(
                  '${widget.score}',
                  style:
                      nunitoTextStyle.copyWith(fontSize: 45, fontWeight: black),
                ),
              ),
              const SizedBox(height: 60),
              FadeAnimation(
                1.7,
                SizedBox(
                  height: 52,
                  width: 188,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ),
                      );
                    },
                    child: Text(
                      'Kembali',
                      style: nunitoTextStyle.copyWith(
                          color: whiteColor,
                          fontWeight: extraBold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
