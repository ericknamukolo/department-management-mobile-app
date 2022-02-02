import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text('Results',
            style: kBodyTextStyle.copyWith(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Results for acadamic year 2021, Semester VI',
              style: kHintTextStyle,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 250,
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
                children: const [
                  ResultInfo(
                    course: 'Software Engineering',
                    grade: 'A',
                  ),
                  ResultInfo(
                    course: 'Java Programming',
                    grade: 'B',
                  ),
                  ResultInfo(
                    course: 'Financial Accounting',
                    grade: 'A+',
                  ),
                  ResultInfo(
                    course: 'Professional Ethics',
                    grade: 'C',
                  ),
                  ResultInfo(
                    course: 'IPTR',
                    grade: 'B',
                  ),
                  ResultInfo(
                    course: 'DBMS Laboratory',
                    grade: 'B+',
                  ),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 2,
                    endIndent: 60,
                    indent: 60,
                  ),
                  ResultInfo(
                    course: 'G.P.A',
                    grade: '4.3',
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

class ResultInfo extends StatelessWidget {
  final String course;
  final String grade;
  const ResultInfo({
    Key? key,
    required this.course,
    required this.grade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(course, style: kBodyTextStyle),
          Text(grade, style: kHintTextStyle),
        ],
      ),
    );
  }
}
