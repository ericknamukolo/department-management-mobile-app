import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/providers/results.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Results>(context, listen: false).fetchAndSetResults();
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final studentData = Provider.of<Auth>(context, listen: false).student;
    final resultData = Provider.of<Results>(context).results;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text('Results',
            style: kBodyTextStyle.copyWith(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Results for acadamic year 2021, Semester ${resultData[0].semester}',
                      style: kHintTextStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      // height: 250,
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
                        children: [
                          Row(
                            children: [
                              Text(
                                'Module Code',
                                style: kBodyTextStyle.copyWith(fontSize: 12),
                              ),
                              const Spacer(),
                              Text(
                                'CA',
                                style: kBodyTextStyle.copyWith(fontSize: 12),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'SE',
                                style: kBodyTextStyle.copyWith(fontSize: 12),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Grade',
                                style: kBodyTextStyle.copyWith(fontSize: 12),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Total',
                                style: kBodyTextStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            itemBuilder: (context, index) => ResultInfo(
                              course: resultData[index].moduleCode,
                              grade: resultData[index].grade,
                              mark: resultData[index].total,
                              ca: resultData[index].ca,
                              se: resultData[index].se,
                            ),
                            itemCount: resultData.length,
                            shrinkWrap: true,
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            thickness: 2,
                            endIndent: 60,
                            indent: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('G.P.A', style: kBodyTextStyle),
                              Text(resultData[0].gpa, style: kHintTextStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('C.G.P.A', style: kBodyTextStyle),
                              Text(resultData[0].cgpa, style: kHintTextStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ResultInfo extends StatelessWidget {
  final String course;
  final String grade;
  final int? mark;
  final int ca;
  final int se;
  const ResultInfo({
    Key? key,
    required this.course,
    required this.grade,
    required this.ca,
    required this.se,
    this.mark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(course, style: kBodyTextStyle),
          const Spacer(),
          Text(ca.toString(), style: kHintTextStyle),
          const SizedBox(width: 30),
          Text(se.toString(), style: kHintTextStyle),
          const SizedBox(width: 30),
          Text(grade, style: kHintTextStyle),
          const SizedBox(width: 30),
          Text(mark.toString(), style: kHintTextStyle),
        ],
      ),
    );
  }
}
