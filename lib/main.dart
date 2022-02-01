import 'package:flutter/material.dart';
import 'package:student_app/providers/auth.dart';
import 'package:student_app/providers/notifications.dart';
import 'package:student_app/screens/home.dart';
import 'package:student_app/screens/log_in_screen.dart';
import 'package:student_app/screens/sign_up_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StudentApp());
}

class StudentApp extends StatelessWidget {
  const StudentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => Notifications(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // accentColor: const Color(0xff055052),
          primaryColor: const Color(0xff4b6587),
          secondaryHeaderColor: const Color(0xff7a8fa6),
          fontFamily: 'Poppins',
        ),
        home: const LoginScreen(),
        builder: BotToastInit(),
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
      ),
    );
  }
}
