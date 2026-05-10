import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const String name = 'HomepageScreen';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager',style: TextStyle(

        ),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),


    );
  }
}
