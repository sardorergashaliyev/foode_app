import 'package:flutter/material.dart';
import 'package:foody/pages/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then(
      (value) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (a) => OnBoarding(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 334,
          height: 346,
          child: Image.asset('assets/image/fulllogo.png'),
        ),
      ),
    );
  }
}
