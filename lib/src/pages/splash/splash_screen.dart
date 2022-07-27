import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/auth/sign_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SignScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green, CustomColors.customSwatchColor],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 40,
                ),
                children: [
                  const TextSpan(
                    text: "Green",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: "grocer",
                    style: TextStyle(color: CustomColors.customContrastColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
