import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:student_app/models/student.dart';

class Auth with ChangeNotifier {
  String? token;
  int? statusCode;
  Student? student;
  Future<void> signUp(Student student) async {
    const url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/students/auth/signUp';
    var response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'first_name': student.firstName,
          'last_name': student.lastName,
          'mobile': student.phoneNumber,
          'email': student.email,
          'date_of_birth': student.dob,
          'age': student.age,
          'gender': student.gender,
          'salutation': student.salutation,
          'blood_group': student.bloodGroup,
          'nationality': student.nationality,
          'address': student.address,
          'course': student.course,
          'password': student.password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    notifyListeners();
  }

  Future<void> logIn(String reg, String password) async {
    const url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/students/auth/signIn';
    var response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'studentId': reg,
          'password': password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    statusCode = response.statusCode;
    print(response.body);
    var data = json.decode(response.body)['student'];
    if (data == null) {
      return;
    }
    student = Student(
      firstName: data['first_name'],
      lastName: data['last_name'],
      address: data['address'],
      age: data['age'],
      bloodGroup: data['blood_group'],
      dob: data['date_of_birth'],
      course: data['course'],
      email: data['email'],
      gender: data['first_name'],
      nationality: data['nationality'],
      password: data['studentId'],
      phoneNumber: data['mobile'],
      salutation: data['first_name'],
    );

    notifyListeners();
  }
}
