import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/signin_screen.dart';
import 'package:task_manager/widget/appbar_widget.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  static const String name = 'update_profile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    void onUpdateButtonTap() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: Colors.white),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'S A Nahid',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                Text(
                  'sanahid@gmail.com',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white60),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              SizedBox(height: 50),

              InkWell(child: CircleAvatar(radius: 60)),

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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'First Name',
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
                decoration: InputDecoration(
                  labelText: 'Last Name',
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
              ElevatedButton(
                onPressed: () {
                  onUpdateButtonTap();
                },
                child: Text('update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
