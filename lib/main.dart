import 'package:flutter/material.dart';
import 'package:mybookapp/constants/color_constant.dart';
// import 'package:mybookapp/models/popularbook_model.dart';
import 'package:mybookapp/screens/home_page.dart';
// import 'package:mybookapp/screens/select_book_screen.dart';
import 'package:mybookapp/screens_login_signup/Welcome/welcome_screen.dart';


import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: kMainColor,
    maximumSize: const Size(double.infinity, 56),
    minimumSize: const Size(double.infinity, 56),
    ),),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kMainColor,
            prefixIconColor: kMainColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide.none,
            ),
          ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kMainColor)
      ) ,
      routes: {
        "/homeScreen": (_)=> new HomePage(),

      },
      home: WelcomeScreen(),

    );
  }
}
