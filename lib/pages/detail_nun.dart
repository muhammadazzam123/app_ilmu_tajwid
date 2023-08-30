import 'package:app_ilmu_tajwid/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailNun extends StatefulWidget {
  final String name,
      bahasaIstilah,
      pengertian,
      huruf,
      caraMembaca,
      suara,
      gambar,
      deskripsi;
  const DetailNun({
    Key? key,
    required this.name,
    required this.bahasaIstilah,
    required this.pengertian,
    required this.huruf,
    required this.caraMembaca,
    required this.suara,
    required this.gambar,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<DetailNun> createState() => _DetailNunState();
}

class _DetailNunState extends State<DetailNun> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: nunitoTextStyle.copyWith(
                color: secondaryColor, fontWeight: black),
          ),
          elevation: 0,
          centerTitle: true,
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
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menurut Bahasa dan Istilah Ialah : ',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: secondaryColor),
                  ),
                  Text(
                    widget.bahasaIstilah,
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: medium),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dalam Pengertian Hukum Nun Bersukun dan Tanwin adalah :',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: secondaryColor),
                  ),
                  Text(
                    widget.pengertian,
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: medium),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hurufnya Apa Saja :',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: secondaryColor),
                  ),
                  Text(
                    widget.huruf,
                    style: nunitoTextStyle.copyWith(
                        fontSize: 25, fontWeight: bold),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cara Membaca :',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: secondaryColor),
                  ),
                  Text(
                    widget.caraMembaca,
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: medium),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Contoh : ',
                style: nunitoTextStyle.copyWith(
                    fontSize: 15, fontWeight: black, color: secondaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.play(UrlSource(widget.suara));
                        }
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        size: 40,
                        color: secondaryColor,
                      )),
                  Image.network(widget.gambar, height: 40)
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.deskripsi,
                style:
                    nunitoTextStyle.copyWith(fontSize: 15, fontWeight: medium),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
