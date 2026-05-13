import 'package:flutter/material.dart';
import 'package:task_manager/screens/update_profile.dart';


class AppbarWidget extends StatelessWidget implements PreferredSizeWidget  {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(

      title: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(

            onTap: (){Navigator.pushNamed(context, UpdateProfile.name);} ,
            child: CircleAvatar(backgroundColor: Colors.white)),
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
