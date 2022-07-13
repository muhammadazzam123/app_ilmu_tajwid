import 'package:app_ilmu_tajwid/theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailNun extends StatefulWidget {
  final int id;
  final String name;
  final String bahasaIstilah;
  final String pengertian;
  final String huruf;
  final String caraMembaca;
  final String gambar;
  final String audio;
  final String deskripsi;
  const DetailNun(this.id, this.name, this.bahasaIstilah, this.pengertian,
      this.huruf, this.caraMembaca, this.gambar, this.audio, this.deskripsi,
      {Key? key})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<DetailNun> createState() => _DetailNunState(id, name, bahasaIstilah,
      pengertian, huruf, caraMembaca, gambar, audio, deskripsi);
}

class _DetailNunState extends State<DetailNun> {
  // ignore: unused_field
  final int _id;
  final String _name;
  final String _bahasaIstilah;
  final String _pengertian;
  final String _huruf;
  final String _caraMembaca;
  final String _gambar;
  final String _audio;
  final String _deskripsi;

  _DetailNunState(
    this._id,
    this._name,
    this._bahasaIstilah,
    this._pengertian,
    this._huruf,
    this._caraMembaca,
    this._gambar,
    this._audio,
    this._deskripsi,
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
                    _bahasaIstilah,
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
                    _pengertian,
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
                    _huruf,
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
                    _caraMembaca,
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
                          final String url = _audio;
                          await audioPlayer.play(url);
                        }
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        size: 40,
                        color: secondaryColor,
                      )),
                  Image.network(_gambar, height: 40)
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _deskripsi,
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
