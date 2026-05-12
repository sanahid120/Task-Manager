import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/signin_screen.dart';

class SetNewPassword extends StatelessWidget {
  const SetNewPassword({super.key});
  static const String name  = 'SetNewPassword';
  @override
  Widget build(BuildContext context) {
    void onSignInButton() {
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);
    }
    void onConfirmButton() {

    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              SizedBox(height: 50),
              Text(
                'Set New Password',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text('your password must contain least 6 digits numbers or special characters',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Password',

                ),

                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.green),

                ),

                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ElevatedButton(onPressed: () {
                onConfirmButton();
              }, child: Text('confirm')),
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
                            text: 'Sign In',
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
