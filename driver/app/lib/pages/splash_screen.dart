import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/splash/cab.png",
              height: size.height * 0.1,
              fit: BoxFit.cover,
            ),
            heightSpace,
            const Text(
              "CABWIND",
              style: rasa24BoldPrimary,
            ),
            const Spacer(),
            const Text(
              "DRIVER APP",
              style: semibold12Grey,
            ),
            heightSpace,
          ],
        ),
      ),
    );
  }
}
