import 'package:app_ilmu_tajwid/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailMakhroj extends StatefulWidget {
  final int id;
  final String name;
  final String huruf;
  final String gambar;
  final String audio;
  const DetailMakhroj(this.id, this.name, this.huruf, this.gambar, this.audio,
      {Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DetailMakhroj> createState() => _DetailMakhrojState(
        id,
        name,
        huruf,
        gambar,
        audio,
      );
}

class _DetailMakhrojState extends State<DetailMakhroj> {
  // ignore: unused_field
  final int _id;
  final String _name;
  final String _huruf;
  final String _gambar;
  final String _audio;

  _DetailMakhrojState(
    this._id,
    this._name,
    this._huruf,
    this._gambar,
    this._audio,
  );
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
            _name,
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
          children: [
            Image.network(
              _gambar,
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
                    _huruf,
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
                          String url = _audio;
                          await audioPlayer.play(url);
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
