import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart'; // 추가

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // 3초 뒤 login 페이지로 이동
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경 흰색
      body: Center(
        child: Image.asset(
          'assets/images/beam.png', // 이미지 경로
          width: 150, // 원하는 크기로 조절
        ),
      ),
    );
  }
}
