import 'package:flutter/material.dart';
import 'detail_list.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6), // 이미지와 유사한 배경색
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // MyHomePage와 동일한 높이
        child: SafeArea(
          child: Container(
            color: Colors.white, // 배경색 흰색
            padding: const EdgeInsets.only(top: 50, bottom: 12, left: 16, right: 16),
            // --- 여기 수정 시작: Row 대신 Stack 사용 ---
            child: Stack(
              children: [
                // 중앙에 위치할 "필름 환전소" 텍스트
                Align(
                  alignment: Alignment.center, // Container의 중앙에 정렬
                  child: const Text(
                    '투자 목록',
                    style: TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontSize: 18,
                      fontWeight: FontWeight.w600, // Semibold (Pretendard 폰트 가정)
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
                // 오른쪽에 위치할 닫기(X) 아이콘
                Positioned(
                  right: 0, // Container의 right padding 16과 IconButton의 기본 패딩이 합쳐져서 적절히 위치
                  top: 0,
                  bottom: 0, // 수직 중앙 정렬
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF1C1C1C)),
                    onPressed: () {
                      Navigator.pop(context); // 이전 화면으로 돌아가기
                    },
                  ),
                ),
              ],
            ),
            // --- 수정 끝 ---
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '언젠가는 슬기로운 전공의생활',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '주연배우 - 고윤정, 정준원, 신시아',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DetailListPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(200, 200, 200, 1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('자세히 보기'),
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}