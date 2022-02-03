import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:student_app/models/student.dart';
import 'package:student_app/providers/auth.dart';

class Students with ChangeNotifier {
  List<Student> _students = [];
  List<Student> get students {
    return [..._students];
  }

  Future<void> fetchAndSetStudents() async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/admin/allStudents';

    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var data = json.decode(response.body);
    List<Student> loadedStudents = [];
    if (data == null) {
      return;
    }
    print(data);
    data['data'].forEach(
      (student) => {
        loadedStudents.add(
          Student(
            firstName: student['first_name'],
            lastName: student['last_name'],
            address: student['address'],
            age: student['age'],
            bloodGroup: student['blood_group'],
            dob: student['date_of_birth'],
            course: student['course'],
            email: student['email'],
            gender: student['first_name'],
            nationality: student['nationality'],
            password: student['password'],
            phoneNumber: student['mobile'],
            salutation: student['salutation'],
            accStatus: student['account_state'],
          ),
        ),
      },
    );
    _students = loadedStudents;
    notifyListeners();
  }
}
