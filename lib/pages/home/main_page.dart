import 'package:flutter/material.dart';
import 'package:laravel_flutter/theme.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {},
        child: Image.asset('assets/Cart_Icon.png', width: 20),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor4,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/Home_Icon.png',
                    width: 21,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Chat_Icon.png',
                      width: 20,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Favorite_Icon.png',
                      width: 20,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Profile_Icon.png',
                      width: 18,
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: Center(child: Text('Home Page')),
    );
  }
}
