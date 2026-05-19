import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Data/Services/auth_controllers.dart';
import 'package:task_manager/Data/Services/network_caller.dart';
import 'package:task_manager/Data/Services/user_model.dart';
import 'package:task_manager/screens/forgot_password_email.dart';
import 'package:task_manager/screens/homepage.dart';
import 'package:task_manager/screens/signup_screen.dart';
import 'package:task_manager/utils/urls.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = 'SignInScreen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool loginProgress = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void onSignUpButton() {
    Navigator.pushNamed(context, SignUp_Screen.name);
  }

  Future<void> signIn() async {
    loginProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      'email': emailController.text.trim(),
      'password': passwordController.text,
    };

    final NetworkResponse response = await NetworkCaller.postRequest(
      Urls.signInUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      UserModel userModel = UserModel.fromJson(response.body['data']);
      String accessToken = response.body['token'];
      await AuthControllers.saveUserData(accessToken,userModel);


      Navigator.pushNamedAndRemoveUntil(
        context,
        Homepage.name,
            (predicate) => false,
      );
      dispose();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${response.errorMessage}")));
    }
    loginProgress = false;
    setState(() {});
  }

  void onSignInButton() {
    if (signInFormKey.currentState!.validate()) {}
    signIn();

  }


  void onForgotPasswordButton() {
    Navigator.pushNamed(context, ForgotPasswordEmail.name);
  }
  @override
  Widget build(BuildContext context) {








    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Form(
            key: signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                SizedBox(height: 50),
                Text(
                  'Get Started With',
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Email';
                    } else if (EmailValidator.validate(value!) == false) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  controller: emailController,
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Password';
                    }
                    if (value!.length < 6) {
                      return 'Your Password must be least of 6 character';
                    }

                    return null;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.green),
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
                  visible: loginProgress == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                    onPressed: () {
                      onSignInButton();
                    },
                    child: Text('login'),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          onForgotPasswordButton();
                        },
                        child: Text('Forgot Password?'),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          text: 'Don\'t you have an account? ',
                          children: [
                            TextSpan(
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                              text: 'SignUp',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  onSignUpButton();
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
    );
  }
}
