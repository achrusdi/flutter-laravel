import 'package:flutter/material.dart';
import 'package:laravel_flutter/pages/signin_page.dart';
import 'package:laravel_flutter/pages/signup_page.dart';
import 'package:laravel_flutter/pages/splash_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SpalshPage(),
        '/signin': (context) => SigninPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
