import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/signin_screen.dart';

class PinVerfication extends StatelessWidget {
  const PinVerfication({super.key});
static const String name = 'Pin_Verification';
  @override
  Widget build(BuildContext context) {
    void onSignInButton() {
      Navigator.pushReplacementNamed(context, SignInScreen.name);
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
                  'PIN Verification',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(

                  )
              ),

              Text('Enter the 6 digit pin sent to your email address',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
              SizedBox(height: 10),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pin',
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
                onSubmitButton();
              }, child: Text('submit')),
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

  void onSubmitButton() {}


}
