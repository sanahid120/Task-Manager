import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Data/Services/network_caller.dart';
import 'package:task_manager/screens/homepage.dart';
import 'package:task_manager/screens/signin_screen.dart';
import 'package:task_manager/utils/urls.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});
  static const String name = 'SignUpScreen';

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}


class _SignUp_ScreenState extends State<SignUp_Screen> {
  bool signUpInProgress =false;


  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    void dispose() {
      emailController.dispose();
      firstNameController.dispose();
      lastNameController.dispose();
      phoneController.dispose();
      passwordController.dispose();
      super.dispose();
    }
    void onSignInButton() {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }




    Future<void> _signUp()async{
      setState(() {
        signUpInProgress =true;
      });

      Map<String, dynamic> requestBody ={
        'email': emailController.text.trim(),
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'mobile': phoneController.text,
        'password': passwordController.text,
      };
      NetworkResponse response =await NetworkCaller.postRequest(Urls.registrationUrl, body: requestBody);
      if(response.isSuccess){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.grey,content: Text('Your registration is Successful! Please Login now.')));
        Navigator.pop(context);
        dispose();
      }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.grey,content: Text("${response.errorMessage}")));
        }
      setState(() {
        signUpInProgress =false;
      });
    }

    void onSignUpButton() {
      if(formKey.currentState!.validate()){
        _signUp();
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Join With Us',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',

                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty?? true){
                        return 'Enter your Email';


                      }
                      else if(EmailValidator.validate(value!)==false){
                        return 'Enter a valid email address';

                      }

                      return null;

                    },

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: firstNameController,
                    validator: (String? value){
                      if(value?.isEmpty?? true){
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'First Name',

                    ),

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: lastNameController,
                    validator: (String? value){
                      if(value?.isEmpty?? true){
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Last Name',

                    ),

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: phoneController,
                    validator: (String? value){
                      if(value?.isEmpty?? true){
                        return 'Enter your Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    controller: passwordController,
                    validator: (String? value){
                      if(value?.isEmpty?? true){
                        return 'Enter your Password';
                      }
                      if(value!.length<6){
                        return 'Your Password must be least of 6 character';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Passsword',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),

                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Visibility(
                    visible: signUpInProgress ==false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        onSignUpButton();
                      },
                      child: Text('Register'),
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                            text: 'Already have an account? ',
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                text: 'SignIn',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    onSignInButton();
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );

  }

}

