import 'package:flutter/material.dart';
import 'home.dart'; // home.dart 파일 임포트 확인

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경 흰색
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Column의 주 축 정렬은 중앙으로 유지
          children: [
            // 첫 번째 Spacer의 flex 값을 더 늘려 위에 더 많은 공간을 확보합니다.
            // 예를 들어 텍스트를 더 아래로 내리려면 이 flex 값을 늘려보세요.
            const Spacer(flex: 4), // 이전 4에서 5로 늘려 더 내려봅니다 (예시)
            // 혹은 여기에 SizedBox를 사용하여 고정된 간격을 줄 수도 있습니다.
            // SizedBox(height: 150), // 예를 들어 텍스트를 위에서 150픽셀 아래로 밀고 싶다면

            const Text(
              "간편하게 로그인하고\n다양한 서비스를 이용해보세요",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF1C1C1C),
                fontWeight: FontWeight.normal,
              ),
            ),

            // 텍스트와 버튼 사이의 간격. 이 Spacer는 두 요소의 상대적 거리를 조절합니다.
            // 만약 텍스트와 버튼 간의 거리를 고정하고 싶다면, 이 부분을 SizedBox로 변경할 수 있습니다.
            const Spacer(flex: 3), // 이 값은 유지하여 아래 버튼과의 비율을 조절하거나,
            // SizedBox(height: 100), // 혹은 고정된 픽셀 간격으로 대체할 수 있습니다.

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: '홈 페이지')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFE812), // 카카오 노랑색
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "카카오 로그인",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xFF121212)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // 버튼 아래 고정된 40픽셀 간격 (이것은 괜찮습니다)
          ],
        ),
      ),
    );
  }
}