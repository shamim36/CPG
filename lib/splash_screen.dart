import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_maker/dash_board.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
              'assets/Lottie/Animation - 1709383571732.json',
            ),
          ),
        ],
      ),
      nextScreen: DashBoard(),
      splashIconSize: 400,
      backgroundColor: const Color.fromRGBO(167,171,185,0.5), //
    );
  }
}
