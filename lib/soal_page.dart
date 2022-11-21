import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class SoalPage extends StatelessWidget {
  const SoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Latihan Soal',
                    style: nunitoTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: extraBold,
                    ),
                  ),
                  Text(
                    'Ilmu Tajwid',
                    style: nunitoTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: extraBold,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.only(left: 78, right: 78),
                child: Text(
                  'Latihan soal terdiri dari sepuluh pilihan ganda',
                  style: nunitoTextStyle.copyWith(
                      fontSize: 15, fontWeight: medium),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 81),
              SizedBox(
                height: 52,
                width: 188,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Mulai',
                      style: nunitoTextStyle.copyWith(
                          fontSize: 24,
                          color: whiteColor,
                          fontWeight: extraBold),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
