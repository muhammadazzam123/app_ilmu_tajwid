import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<bool> exitButton() async {
    final value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Keluar'),
            content: const Text('Apakah kamu mau keluar'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Iya'),
              )
            ],
          );
        });
    if (value != null) {
      return Future.value(value);
    } else {
      return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () => exitButton(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Ikhwan2.png', width: 130),
                const SizedBox(height: 40),
                Text(
                  'Syukron Katsiron',
                  style: nunitoTextStyle.copyWith(
                      fontSize: 32, color: primaryColor, fontWeight: extraBold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 264,
                  child: Text(
                    'telah menggunakan app ilmu tajwid sebagai sarana dalam pembelajaran ilmu tajwid',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, color: blackColor, fontWeight: medium),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 52,
                  width: 188,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      exitButton();
                    },
                    child: Text(
                      'Keluar',
                      style: nunitoTextStyle.copyWith(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: extraBold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
