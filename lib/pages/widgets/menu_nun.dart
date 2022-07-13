import 'package:app_ilmu_tajwid/models/models_nun.dart';
import 'package:app_ilmu_tajwid/pages/components/detail_nun.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class MenuNun extends StatelessWidget {
  final NunSukun menu;
  const MenuNun(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                height: 70,
                width: 156,
                child: Text(
                  menu.name,
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
                      primary: secondaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailNun(
                          menu.id,
                          menu.name,
                          menu.bahasaIstilah,
                          menu.pengertian,
                          menu.huruf,
                          menu.caraMembaca,
                          menu.gambar,
                          menu.audio,
                          menu.deskripsi,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
