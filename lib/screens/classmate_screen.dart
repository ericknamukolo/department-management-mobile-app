import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';

class ClassMateScreen extends StatelessWidget {
  const ClassMateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(
          'Class Mates',
          style: kBodyTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: const [
            Text(
              'Grace Banda',
              style: kBodyTextStyle,
            ),
            Text(
              'Ben Mulenga',
              style: kBodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
