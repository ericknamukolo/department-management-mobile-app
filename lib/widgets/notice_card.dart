import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String semester;
  final String message;

  const NoticeCard({
    Key? key,
    required this.title,
    required this.semester,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.16),
            blurRadius: 6.0,
            offset: const Offset(0.0, 3.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: const EdgeInsets.only(right: 20),
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
                child: Icon(
                  Icons.warning_rounded,
                  size: 35,
                  color: Theme.of(context).errorColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kTitleTextStyleDark,
                  ),
                  Row(
                    children: [
                      Text(semester, style: kSubTitleTextStyleDark),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.circle,
                          size: 13,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                      const Text(
                        '10/10/2021',
                        style: kSubTitleTextStyleDark,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            message,
            style: kBodyTextStyle,
          ),
        ],
      ),
    );
  }
}
