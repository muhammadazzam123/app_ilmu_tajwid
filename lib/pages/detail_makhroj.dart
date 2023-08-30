import 'package:app_ilmu_tajwid/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailMakhroj extends StatefulWidget {
  final String name, huruf, suara, gambar;
  const DetailMakhroj({
    Key? key,
    required this.name,
    required this.huruf,
    required this.suara,
    required this.gambar,
  }) : super(key: key);

  @override
  State<DetailMakhroj> createState() => _DetailMakhrojState();
}

class _DetailMakhrojState extends State<DetailMakhroj> {
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
                color: primaryColor, fontWeight: black),
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
            Image.network(
              widget.gambar,
              height: 260,
            ),
            const SizedBox(height: 22),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Huruf Yang Keluar : ',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: primaryColor),
                  ),
                  Text(
                    widget.huruf,
                    style: nunitoTextStyle.copyWith(
                        fontSize: 20, fontWeight: bold),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contoh : ',
                    style: nunitoTextStyle.copyWith(
                        fontSize: 15, fontWeight: black, color: primaryColor),
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.play(UrlSource(widget.suara));
                        }
                      },
                      icon: Icon(
                        isPlaying
                            ? Icons.volume_up_rounded
                            : Icons.volume_mute_rounded,
                        size: 37,
                        color: primaryColor,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
