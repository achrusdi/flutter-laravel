import 'package:flutter/material.dart';
import 'package:laravel_flutter/pages/edit_profile.dart';
import 'package:laravel_flutter/pages/home/main_page.dart';
import 'package:laravel_flutter/pages/signin_page.dart';
import 'package:laravel_flutter/pages/signup_page.dart';
import 'package:laravel_flutter/pages/splash_page.dart';
import 'package:laravel_flutter/providers/auth_provider.dart';
import 'package:laravel_flutter/providers/product_provider.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signin': (context) => SigninPage(),
          '/signup': (context) => SignupPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
        },
      ),
    );
  }
}
