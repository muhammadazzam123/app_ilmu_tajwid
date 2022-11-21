import 'package:app_ilmu_tajwid/about_page.dart';
import 'package:app_ilmu_tajwid/home_page.dart';
import 'package:app_ilmu_tajwid/soal_page.dart';
import 'package:app_ilmu_tajwid/theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavPageState();
}

class _NavPageState extends State<NavBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const HomePage(),
    const SoalPage(),
    const AboutPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 74,
        child: BottomNavigationBar(
          unselectedIconTheme: const IconThemeData(
            size: 35,
          ),
          unselectedLabelStyle: nunitoTextStyle.copyWith(
            fontSize: 13,
            fontWeight: extraBold,
          ),
          selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
          selectedItemColor: primaryColor,
          selectedLabelStyle: nunitoTextStyle.copyWith(
              color: primaryColor, fontSize: 13, fontWeight: extraBold),
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Latihan Soal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'About',
            ),
          ],
        ),
      ),
    );
  }
}
