import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/pin_verfication.dart';
import 'package:task_manager/screens/signin_screen.dart';

class ForgotPasswordEmail extends StatelessWidget {
  const ForgotPasswordEmail({super.key});


  static const String name = 'ForgotPasswordEmailScreen';

  @override
  Widget build(BuildContext context) {
    void onVerifyButton() {
      Navigator.pushNamed(context, PinVerfication.name);
    }
    void onSignInButton() {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    }
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: 50),
              Text(
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(

                )
              ),

              Text('a 6 digit pin will send to your email address',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
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


              ElevatedButton(onPressed: () {
                onVerifyButton();
              }, child: Text('verify')),
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
                            style: TextStyle(color: Colors.green,
                                fontWeight: FontWeight.bold),
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
    );
  }




}
