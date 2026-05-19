import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_manager/screens/add_new_task.dart';
import 'package:task_manager/screens/forgot_password_email.dart';
import 'package:task_manager/screens/homepage.dart';
import 'package:task_manager/screens/pin_verfication.dart';
import 'package:task_manager/screens/set_new_password.dart';
import 'package:task_manager/screens/signin_screen.dart';
import 'package:task_manager/screens/signup_screen.dart';
import 'package:task_manager/screens/splash_screen.dart';
import 'package:task_manager/screens/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        textTheme: TextTheme(


        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          fixedSize: Size.fromWidth(double.maxFinite),
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(8))
          )
        )),

        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: Colors.grey,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 8,
            fontStyle: FontStyle.italic,
          ),
          labelStyle: TextStyle(
            color: Colors.green,
                fontSize: 16,
            overflow: TextOverflow.ellipsis,



          ),
          fillColor: Colors.white,



          errorBorder: OutlineInputBorder(

          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),

          disabledBorder: OutlineInputBorder(),

          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        colorSchemeSeed: Colors.green,
      ),

      routes: {
        Homepage.name: (context) => Homepage(),
        SignInScreen.name: (context) => SignInScreen(),
        SignUp_Screen.name: (context) => SignUp_Screen(),
        ForgotPasswordEmail.name: (context) => ForgotPasswordEmail(),
        PinVerfication.name: (context) => PinVerfication(),
        SetNewPassword.name: (context) => SetNewPassword(),
        AddNewTask.name: (context) => AddNewTask(),
        UpdateProfile.name: (context) => UpdateProfile(),

      },
      home: SplashScreen(),
    );
  }
}
