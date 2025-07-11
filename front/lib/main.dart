import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'; // ✅ 이거 추가!
import 'landing.dart'; // 추가

void main() {
  KakaoSdk.init(nativeAppKey: '6b623c827cca9cc0d3a014d5c6b9ca33');
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
    );
  }
}
