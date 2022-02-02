import 'package:flutter/material.dart';
import 'package:student_app/screens/home_screen.dart';
import 'package:student_app/screens/notice_screen.dart';
import 'package:student_app/screens/profile_screen.dart';
import 'package:student_app/screens/result_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [
    const HomeScreen(),
    const ResultsScreen(),
    const NoticeScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xfff8f8f8),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color(0xff7A8FA6),
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: 25,
            ),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.warning_rounded,
              size: 25,
            ),
            label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 25,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
