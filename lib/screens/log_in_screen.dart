import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/screens/home.dart';
import 'package:student_app/screens/sign_up_screen.dart';
import 'package:student_app/widgets/input_field.dart';
import 'package:student_app/widgets/simple_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _regNumber;
  String? _password;
  Future<void> logInForm() async {
    var _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      BotToast.showLoading();
      /////////////////////
      await Provider.of<Auth>(context, listen: false)
          .logIn(_regNumber!, _password!);
      print('done');
      int? statusCode = Provider.of<Auth>(context, listen: false).statusCode;
      BotToast.closeAllLoading();
      if (statusCode == 200) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else {
        BotToast.showText(
          text: 'Something went wrong or your account is still being processed',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
          child: Text('Log In'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Log In',
                  style: kTitleTextStyleDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Log in to your student Account',
                  style: kSubTitleTextStyleDark.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              InputField(
                hint: 'Register Number',
                onChanged: (value) {
                  _regNumber = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                },
                type: TextInputType.number,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'No account? Sign Up',
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SimpleButton(
                text: 'Log In',
                click: logInForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
