import 'package:flutter/material.dart';
import 'landing.dart'; // 추가

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beam App',
      home: const LandingPage(), // 첫 페이지를 LandingPage로!
      theme: ThemeData(
        fontFamily: 'Pretendard', // 여기에 pubspec.yaml에 정의한 폰트 family 이름을 사용합니다.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
