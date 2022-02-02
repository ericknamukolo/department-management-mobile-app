import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/screens/classmate_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<Auth>(context, listen: false).student;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(
          'Home Screen',
          style: kBodyTextStyle.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  '${studentData!.firstName} ${studentData.lastName}',
                  style: kBodyTextStyle,
                ),
                Text(
                  studentData.course,
                  style: kHintTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HomeCard(
                  title: 'Sylabus',
                  icon: Icons.book,
                ),
                HomeCard(
                  title: 'Class Mates',
                  icon: Icons.supervised_user_circle,
                  click: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ClassMateScreen()));
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomeCard(
                  title: 'Results',
                  icon: Icons.menu_book,
                ),
                HomeCard(
                  title: 'Attendance',
                  icon: Icons.school,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final Function()? click;
  final IconData icon;
  final String title;
  const HomeCard({
    Key? key,
    required this.icon,
    required this.title,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.16),
              blurRadius: 6.0,
              offset: const Offset(0.0, 3.0),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
            Text(title, style: kBodyTextStyle),
          ],
        ),
      ),
    );
  }
}
