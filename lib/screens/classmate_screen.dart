import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/providers/students.dart';

class ClassMateScreen extends StatefulWidget {
  const ClassMateScreen({Key? key}) : super(key: key);

  @override
  State<ClassMateScreen> createState() => _ClassMateScreenState();
}

class _ClassMateScreenState extends State<ClassMateScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Students>(context, listen: false).fetchAndSetStudents();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<Students>(context)
        .students
        .where((stud) => stud.accStatus == true)
        .toList();
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
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => SingleStudent(
                  fname: studentData[index].firstName,
                  lname: studentData[index].lastName,
                  course: studentData[index].course,
                ),
                shrinkWrap: true,
                itemCount: studentData.length,
              ),
      ),
    );
  }
}

class SingleStudent extends StatelessWidget {
  final String fname;
  final String lname;
  final String course;
  const SingleStudent({
    Key? key,
    required this.fname,
    required this.lname,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$fname $lname',
            style: kBodyTextStyle,
          ),
          Text(course, style: kHintTextStyle),
        ],
      ),
    );
  }
}
