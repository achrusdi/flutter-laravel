import 'package:flutter/material.dart';
import 'package:laravel_flutter/models/user.model.dart';
import 'package:laravel_flutter/providers/auth_provider.dart';
import 'package:laravel_flutter/theme.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                  hintText: '${user.name}',
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: subtitleColor,
                  ))),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                  hintText: '@${user.username}',
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: subtitleColor,
                  ))),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                  hintText: user.email,
                  hintStyle: primaryTextStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: subtitleColor,
                  ))),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/Image_Profile.png'))),
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      // appBar: AppBar(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}