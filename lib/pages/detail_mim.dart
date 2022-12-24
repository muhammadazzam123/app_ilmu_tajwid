import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailMim extends StatefulWidget {
  final String name, pengertian, huruf, caraMembaca, suara, gambar, deskripsi;
  const DetailMim({
    Key? key,
    required this.name,
    required this.pengertian,
    required this.huruf,
    required this.caraMembaca,
    required this.suara,
    required this.gambar,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<DetailMim> createState() => _DetailMimState();
}

class _DetailMimState extends State<DetailMim> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
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
            style:
                nunitoTextStyle.copyWith(color: fourthColor, fontWeight: black),
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
          children: [
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengertian :',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: fourthColor),
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Huruf :',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: fourthColor),
                  ),
                  Text(
                    widget.huruf,
                    style: nunitoTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
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
                        fontSize: 15, fontWeight: black, color: fourthColor),
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
                    fontSize: 15, fontWeight: black, color: fourthColor),
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
                          final String url = widget.suara;
                          await audioPlayer.play(url);
                        }
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        size: 37,
                        color: fourthColor,
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
