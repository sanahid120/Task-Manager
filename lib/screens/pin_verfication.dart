import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/set_new_password.dart';
import 'package:task_manager/screens/signin_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerfication extends StatelessWidget {
  const PinVerfication({super.key});
  static const String name = 'Pin_Verification';
  @override
  Widget build(BuildContext context) {
    void onSignInButton() {
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);
    }
    void onSubmitButton() {
      Navigator.pushNamedAndRemoveUntil(context, SetNewPassword.name, (predicate)=>false);
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
                'PIN Verification',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(),
              ),

              Text(
                'Enter the 6 digit pin sent to your email address',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 10),

              Center(
                child: MaterialPinField(
                  length: 6,
                  onCompleted: (pin) => print('PIN: $pin'),
                  onChanged: (value) => print('Changed: $value'),
                  theme: MaterialPinTheme(
                    spacing: 14,
                    focusedFillColor: Colors.white,
                    shape: MaterialPinShape.outlined,
                    cellSize: Size(56, 64),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  onSubmitButton();
                },
                child: Text('submit'),
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
    );
  }


}
