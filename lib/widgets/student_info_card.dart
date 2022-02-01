import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';

class StudentInfoCard extends StatelessWidget {
  final String title;
  final String titleData;
  StudentInfoCard({
    required this.title,
    required this.titleData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      color: Colors.white,
      height: 85,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kSubTitleTextStyleDark.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            titleData,
            style: kBodyTextStyle,
          ),
          //Spacer(),
          const Divider(
            thickness: 2,
            color: Color(0xffE1EBEB),
          ),
        ],
      ),
    );
  }
}
