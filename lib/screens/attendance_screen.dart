import 'package:flutter/material.dart';

import '../constants.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(
          'Attendance',
          style: kBodyTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: const Text('Your current attendance is : 85%'),
      ),
    );
  }
}
