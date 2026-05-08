import 'package:flutter/material.dart';
import 'package:task_manager/utils/asset_paths.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {


  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    nextScreen();
  }

  Future <void> nextScreen() async{
    await Future.delayed(Duration(seconds:2 ));
    Navigator.pushReplacementNamed(context,'/homepage');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.asset(
                AssetPaths.splashScreenImage,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Positioned(bottom: 60,right: MediaQuery.widthOf(context)/2, child: CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.green,))
            ],
          ),
        ),
      ),
    );
  }
}
