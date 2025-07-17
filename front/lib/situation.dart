import 'package:flutter/material.dart';
import 'home.dart';
import 'my.dart';

class SituationPage extends StatelessWidget {
  const SituationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6), // 이미지와 유사한 배경색
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // MyHomePage와 동일한 높이
        child: SafeArea(
          child: Container(
            color: Colors.white, // 배경색 흰색
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 12,
              left: 16,
              right: 16,
            ),
            // --- 여기 수정 시작: Row 대신 Stack 사용 ---
            child: Stack(
              children: [
                // 중앙에 위치할 "필름 환전소" 텍스트
                Align(
                  alignment: Alignment.center, // Container의 중앙에 정렬
                  child: const Text(
                    '투자 현황',
                    style: TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w600, // Semibold (Pretendard 폰트 가정)
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
              ],
            ),
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
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Color(0xFFE0E0E0),
                  width: 1.0,
                ), // 테두리 추가
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFF0F0F0), // 회색 배경
                  // 만약 assets/film_reel_icon.png 이미지가 있다면 Image.asset으로 대체
                  child: Icon(Icons.movie, color: Color(0xFF1C1C1C)),
                ),
                title: Text(
                  '언젠가는 슬기로운 전공의...',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF000000),
                    fontSize: 14
                  ),
                ),
                subtitle: Text(
                  '200필름',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w300
                  ),
                ),
                trailing: Text(
                  '배급중',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600, // 배급중 글자만 굵게
                    color: Color(0xFF000000),
                    fontSize: 15
                  ),
                ),
              ),
            ),
            // 투자 현황 목록 아이템 2
            Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFF0F0F0),
                  // 만약 assets/another_film_icon.png 이미지가 있다면 Image.asset으로 대체
                  child: Icon(
                    Icons.movie_creation_outlined,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
                title: Text(
                  '전 남친 물고기는 어디에 살...',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF000000),
                    fontSize: 14
                  ),
                ),
                subtitle: Text(
                  '100필름',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w300
                  ),
                ),
                trailing: Text(
                  '회수 완료',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600, // 배급중 글자만 굵게
                    color: Color(0xFF000000),
                    fontSize: 15
                  ),
                ),
              ),
            ),
          ]
      ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SituationPage(),
                      ), // FilmPage는 film.dart에 정의된 위젯 이름이라고 가정
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/black_situation.png', height: 32),
                      const SizedBox(height: 3),
                      const Text(
                        '투자 현황',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFC8C8C8),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: '홈 페이지'),
                      ), // FilmPage는 film.dart에 정의된 위젯 이름이라고 가정
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Image.asset('assets/images/home.png', height: 44),const SizedBox(height: 10),],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyPage(),
                      ), // FilmPage는 film.dart에 정의된 위젯 이름이라고 가정
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/gray_mypage.png', height: 32),
                      const SizedBox(height: 3),
                      const Text(
                        '마이페이지',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFC8C8C8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
