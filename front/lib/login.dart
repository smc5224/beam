import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> loginWithKakao(BuildContext context) async {
    try {
      // 카카오 로그인 시도
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('✅ 카카오 로그인 성공! access token: ${token.accessToken}');

      // Node.js 서버로 access token 전송
      var res = await http.post(
        Uri.parse('http://10.0.2.2:3000/auth/kakao'), // ⚠️ localhost 대신 IP 확인 필요
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"accessToken": token.accessToken}),
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("✅ 서버 응답: $data");

        // 예: 로그인 후 닉네임 보여주는 Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("환영합니다, ${data['user']['nickname']}님!")),
        );

        // TODO: Navigator로 홈 페이지 이동 등 처리
      } else {
        print("❌ 서버 오류: ${res.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("서버 로그인 실패")),
        );
      }
    } catch (e) {
      print("❌ 카카오 로그인 실패: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("카카오 로그인 실패")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => loginWithKakao(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFE812), // 카카오 노랑
              foregroundColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              "카카오 로그인",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
