import 'package:flutter/material.dart';
import 'package:laravel_flutter/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar();
    }

    Widget content() {
      return Container();
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      // appBar: header(),
      appBar: AppBar(),
      body: content(),
    );
  }
}
