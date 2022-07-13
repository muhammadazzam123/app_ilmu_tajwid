import 'package:app_ilmu_tajwid/models/models_makhroj.dart';
import 'package:app_ilmu_tajwid/pages/components/detail_makhroj.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class MenuMakhroj extends StatelessWidget {
  final Makhorijul menu;
  const MenuMakhroj(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SizedBox(
        height: 150,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        menu.name,
                        style: nunitoTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailMakhroj(
                              menu.id,
                              menu.name,
                              menu.huruf,
                              menu.gambar,
                              menu.audio,
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
                Image.network(menu.gambar, height: 95)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
