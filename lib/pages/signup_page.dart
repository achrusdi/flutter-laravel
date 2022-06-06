import 'package:flutter/material.dart';
import 'package:laravel_flutter/providers/auth_provider.dart';
import 'package:laravel_flutter/theme.dart';
import 'package:laravel_flutter/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignup() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text)) {
        // Navigator.of(context).pushReplacementNamed('/home');
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Failed to register',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style:
                  primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              'Register and Happy Shoping',
              style: subtitleTextStyle,
            )
          ],
        ),
      );
    }

    Widget fullNameInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Full Name',
              style:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(children: [
                Image.asset(
                  'assets/Fullname_Icon.png',
                  width: 17,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: nameController,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Full Name',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ]),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Username',
              style:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(children: [
                Image.asset(
                  'assets/Username_Icon.png',
                  width: 17,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: usernameController,
                    // obscureText: true,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Username',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ]),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Email Address',
              style:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(children: [
                Image.asset(
                  'assets/Email_Icon.png',
                  width: 17,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: emailController,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Email Address',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ]),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Password',
              style:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium)),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(children: [
                Image.asset(
                  'assets/Password_Icon.png',
                  width: 17,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: primaryTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Password',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ]),
      );
    }

    Widget signupButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignup,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text('Sign In',
                  style: purpleTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              fullNameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signupButton(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
