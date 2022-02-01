import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/models/student.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/widgets/input_field.dart';
import 'package:student_app/widgets/simple_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _dob;
  String? _gender;
  String? _phoneNumber;
  int? _age;
  String? _salutation;
  String? _bloodGroup;
  String? _nationality;
  String? _course;
  String? _address;
  String? _password;

  Future<void> signUpForm() async {
    var _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      Student newStudent = Student(
        address: _address!,
        age: _age!,
        bloodGroup: _bloodGroup!,
        course: _course!,
        dob: _dob!,
        email: _email!,
        firstName: _firstName!,
        gender: _gender!,
        lastName: _lastName!,
        nationality: _nationality!,
        password: _password!,
        phoneNumber: _phoneNumber!,
        salutation: _salutation!,
      );
      _formKey.currentState!.save();
      BotToast.showLoading();
      await Provider.of<Auth>(context, listen: false).signUp(newStudent);
      BotToast.closeAllLoading();
      BotToast.showSimpleNotification(
        duration: const Duration(seconds: 8),
        title: 'Registration Successful',
        titleStyle: kTitleTextStyleDark,
        subTitleStyle: kBodyTextStyle,
        subTitle:
            'Dear $_firstName, you will receive an email with your student Id shortly',
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(child: Text('Sign Up')),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Create Account',
                  style: kTitleTextStyleDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Make your student Account',
                  style: kSubTitleTextStyleDark.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              InputField(
                hint: 'First Name',
                onChanged: (value) {
                  _firstName = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.name,
              ),
              InputField(
                hint: 'Last Name',
                onChanged: (value) {
                  _lastName = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.name,
              ),
              InputField(
                hint: 'Phone Number',
                onChanged: (value) {
                  _phoneNumber = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.phone,
              ),
              InputField(
                hint: 'Email Address',
                onChanged: (value) {
                  _email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.emailAddress,
              ),
              InputField(
                hint: 'DOB',
                onChanged: (value) {
                  _dob = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.text,
              ),
              InputField(
                hint: 'Age',
                onChanged: (value) {
                  _age = int.parse(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.number,
              ),
              InputField(
                hint: 'Gender',
                onChanged: (value) {
                  _gender = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.text,
              ),
              InputField(
                hint: 'Salutation',
                onChanged: (value) {
                  _salutation = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.text,
              ),
              InputField(
                hint: 'Blood Group',
                onChanged: (value) {
                  _bloodGroup = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.text,
              ),
              InputField(
                hint: 'Nationality',
                onChanged: (value) {
                  _nationality = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.text,
              ),
              InputField(
                hint: 'Address',
                onChanged: (value) {
                  _address = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.streetAddress,
              ),
              InputField(
                hint: 'Course',
                onChanged: (value) {
                  _course = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.text,
              ),
              InputField(
                hint: 'Password',
                onChanged: (value) {
                  _password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.visiblePassword,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Already have an account? Log In',
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SimpleButton(
                text: 'Create Account',
                click: signUpForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
