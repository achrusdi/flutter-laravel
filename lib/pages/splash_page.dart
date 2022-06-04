import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laravel_flutter/theme.dart';

class SpalshPage extends StatefulWidget {
  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/signin'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/Union.png')),
          ),
        ),
      ),
    );
  }
}
