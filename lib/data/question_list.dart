import 'package:app_ilmu_tajwid/models/models_soal.dart';

List<QuestionModel> questions = [
  QuestionModel('Sebutkan jumlah huruf iqlab ?', {
    '1': true,
    '2': false,
    '3': false,
    '4': false,
  }),
  QuestionModel(
      'Secara bahasa ikhfa merupakan \'as-satru\' yang memiliki arti ?', {
    'Dengung': false,
    'Jelas': false,
    'Samar': true,
    'Memantul': false,
  }),
  QuestionModel('Sebutkan jumlah huruf ikhfa ?', {
    '6': false,
    '4': false,
    '15': true,
    '2': false,
  }),
  QuestionModel('Apa bedanya idgham bighunnah dan idgham bilaghunnah ?', {
    'Dengung dan Jelas': false,
    'Samar dan Dengung': false,
    'Jelas dan Tanpa Dengung': false,
    'Dengung dan Tanpa Dengung': true,
  }),
  QuestionModel(
      'Menurut istilah mengeluarkan setiap huruf dan makhrajnya tanpa memakai dengung pada huruf yang diizh-harkan, ini merupakan istilah dari ?',
      {
        'Iqlab': false,
        'Izhar': true,
        'Ikhfa': false,
        'Idgham Bighunnah': false,
      }),
  QuestionModel('Sebutkan jumlah kelompok dalam pembagian makhraj huruf ?', {
    '5 Kelompok': true,
    '3 Kelompok': false,
    '6 Kelompok': false,
    '2 Kelompok': false,
  }),
  QuestionModel('Kelompok manakah yang memiliki jumlah huruf paling banyak ?', {
    'Kelompok Lidah': true,
    'Kelompok Tenggorokan': false,
    'Kelompok Rongga Mulut': false,
    'Kelompok Dua Bibir': false,
  }),
  QuestionModel('Huruf-huruf mad merupakan huruf yang keluar dari kelompok ?', {
    'Kelompok Dua Bibir': false,
    'Kelompok Rongga Mulut': true,
    'Kelompok Rongga Hidung': false,
    'Kelompok Lidah': false,
  }),
  QuestionModel('Manakah tempat keluar dari kelompok rongga hidung ?', {
    'Idgham Bighunnah': false,
    'Iqlab': false,
    'Ikhfa': false,
    'Semua Benar': true,
  }),
  QuestionModel('Huruf \'Ba\' merupakan huruf dari kelompok ?', {
    'Kelompok Dua Bibir': true,
    'Kelompok Rongga Hidung': false,
    'Kelompok Lidah': false,
    'Kelompok Tenggorokan': false,
  }),
];
