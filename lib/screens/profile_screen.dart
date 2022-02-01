import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/widgets/student_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<Auth>(context, listen: false).student;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 220,
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Profile',
                    style: kTitleTextStyleWhite,
                  ),
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    '${studentData!.firstName} ${studentData.lastName}',
                    style: kSubTitleTextStyleWhite,
                  ),
                  Text(
                    studentData.password,
                    style: kSubTitleTextStyleWhite,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: const Text(
                      'Student Information',
                      style: kTitleTextStyleDark,
                    ),
                  ),
                  StudentInfoCard(
                    title: 'Department',
                    titleData: studentData.course,
                  ),
                  StudentInfoCard(
                    title: 'Semester',
                    titleData: 'X',
                  ),
                  StudentInfoCard(
                    title: 'Class Teacher',
                    titleData: 'Mr. Sivubwa',
                  ),
                  StudentInfoCard(
                    title: 'H.O.D',
                    titleData: 'Ms. Sudah',
                  ),
                  StudentInfoCard(
                    title: 'Cumulative G.P.A',
                    titleData: '4.5',
                  ),
                  StudentInfoCard(
                    title: 'Blood Group',
                    titleData: studentData.bloodGroup,
                  ),
                  StudentInfoCard(
                    title: 'Phone Number',
                    titleData: studentData.phoneNumber,
                  ),
                  StudentInfoCard(
                    title: 'Email Address',
                    titleData: studentData.email,
                  ),
                  StudentInfoCard(
                    title: 'Attendance',
                    titleData: '78 %',
                  ),
                  StudentInfoCard(
                    title: 'Date of Birth',
                    titleData: studentData.dob,
                  ),
                  StudentInfoCard(
                    title: 'Date of Admission',
                    titleData: '10/10/2017',
                  ),
                  StudentInfoCard(
                    title: 'Date of Completion',
                    titleData: '10/10/2021',
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
