import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/presentation/home/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 6,
      ),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset("assets/animation/splash.json",
              alignment: Alignment.center,
              repeat: true,
            reverse: true)),
    );
  }
}
