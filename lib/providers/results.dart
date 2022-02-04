import 'package:flutter/cupertino.dart';
import 'package:student_app/models/result.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/screens/courses_screen.dart' deferred as bs;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Results with ChangeNotifier {
  List<Result> _results = [];
  List<Result> get results {
    return [..._results];
  }

  Future<void> fetchAndSetResults() async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/students/auth/results';

    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InN0dWRlbnRJZCI6IjE3MjExMDU1MDEzIiwiZW1haWwiOiJtdXBlbGFuc293YTQwNEBnbWFpbC5jb20iLCJ1c2Vycm9sYSI6bnVsbH0sImlhdCI6MTY0MzkyODMzMywiZXhwIjoxNjQ0NTMzMTMzfQ.uYOsu0e9idMBS7uNqeuKlUraonkUR3slsmEcvY0hf9E',
      },
    );

    var data = json.decode(response.body);

    List<Result> loadedResults = [];
    if (data == null) {
      return;
    }
    data['Results'].forEach(
      (result) => {
        loadedResults.add(
          Result(
            id: result['id'],
            courseName: result['moduleName'],
            moduleCode: result['moduleCode'],
            gpa: result['gpa'].toString(),
            cgpa: result['current_cgpa'].toString(),
            semester: result['semester'],
            grade: result['Greade'],
            total: result['Total'],
            studentID: result['studentID'],
            ca: result['CA'],
            se: result['SE'],
          ),
        ),
      },
    );
    _results = loadedResults;
    notifyListeners();
  }
}
