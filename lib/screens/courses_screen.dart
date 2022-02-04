import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/screens/result_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text(
          'Courses',
          style: kBodyTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Courses for acadamic year 2021, Semester VI',
              style: kHintTextStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              // height: 220,
              width: double.infinity,
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
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Result(
                    course: 'OOSAD',
                  ),
                  Result(
                    course: 'Digital Signal Processing',
                  ),
                  Result(
                    course: 'Visual Programming',
                  ),
                  Result(
                    course: 'Network Design Security & management',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final String course;
  const Result({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(course, style: kBodyTextStyle),
    );
  }
}
