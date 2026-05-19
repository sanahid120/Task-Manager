import 'package:flutter/material.dart';
import 'package:task_manager/Data/Services/auth_controllers.dart';
import 'package:task_manager/screens/signin_screen.dart';
import 'package:task_manager/screens/update_profile.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () async {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SignInScreen.name,
              (predicate) => false,
            );
            await AuthControllers.logOut();
          },
          icon: Icon(Icons.logout_outlined, color: Colors.white60),
        ),
      ],

      title: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, UpdateProfile.name);
            },
            child: CircleAvatar(backgroundColor: Colors.white),
          ),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
