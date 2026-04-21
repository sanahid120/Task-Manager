import 'package:flutter/material.dart';
import 'package:task_manager/utils/asset_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              AssetPaths.splashScreenImage,
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Positioned(bottom: 60,left: MediaQuery.widthOf(context)/2,child: CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.green,))
          ],
        ),
      ),
    );
  }
}
