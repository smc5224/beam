import 'package:flutter/material.dart';
import 'situation.dart';
import 'home.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});
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
                    '마이 페이지',
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
        padding: const EdgeInsets.all(16.0), // 전체 바디에 패딩 적용
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            // 1. 사용자 정보 카드
            Card(
              color: Colors.white,
              elevation: 0, // 그림자 제거
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양쪽 끝 정렬
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '김소원 님',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    GestureDetector(
                      // '로그아웃' 텍스트 탭 가능하게
                      onTap: () {
                        print('로그아웃 버튼 클릭됨');
                        // TODO: 로그아웃 로직 추가
                      },
                      child: const Text(
                        '로그아웃',
                        style: TextStyle(
                          color: Color(0xFFC8C8C8),
                          fontSize: 14, // 이미지와 동일한 크기
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16), // 카드와 다음 요소 사이 간격
            // 2. 필름 / 금액 충전/환전 카드
            Card(
              color: const Color(0xFFFF5252), // 빨간색 배경
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    // 100 필름 / 충전하기
                    InkWell(
                      // 물결 효과를 위해 InkWell 사용
                      onTap: () {
                        print('100 필름 충전하기 클릭');
                        // TODO: 충전 페이지로 이동 로직 (예: Navigator.push)
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ), // 터치 영역 확장
                        child: Row(
                          children: [
                            // 이미지 대체 (만약 assets/film_icon.png이 있다면 이걸로 바꾸세요)
                            Image.asset('assets/images/film2.png', height: 24),
                            const SizedBox(width: 12),
                            const Text(
                              '100 필름',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const Spacer(), // 남은 공간 채워서 오른쪽으로 밀기
                            const Text(
                              '충전하기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE0E0E0),
                      height: 32,
                      thickness: 0.5,
                    ), // 구분선
                    // 103,450원 / 환전하기
                    InkWell(
                      // 물결 효과를 위해 InkWell 사용
                      onTap: () {
                        print('103,450원 환전하기 클릭');
                        // TODO: 환전 페이지로 이동 로직 (예: Navigator.push)
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ), // 터치 영역 확장
                        child: Row(
                          children: [
                            // 이미지 대체 (만약 assets/money_icon.png이 있다면 이걸로 바꾸세요)
                            Image.asset('assets/images/coin.png', height: 24),
                            const SizedBox(width: 12),
                            const Text(
                              '103,450원',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              '환전하기',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22), // 카드와 다음 요소 사이 간격
            // 3. 투자 현황 섹션
            Card(
              color: Color(0xFFF6F6F6),
              elevation: 0, // 그림자 제거
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 3.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양쪽 끝 정렬
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '투자 현황',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    GestureDetector(
                      // '로그아웃' 텍스트 탭 가능하게
                      onTap: () {
                        print('로그아웃 버튼 클릭됨');
                        // TODO: 로그아웃 로직 추가
                      },
                      child: const Text(
                        '더보기',
                        style: TextStyle(
                          color: Color(0xFFC8C8C8),
                          fontSize: 14, // 이미지와 동일한 크기
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 투자 현황 목록 아이템 1
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
          ],
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
                      Image.asset('assets/images/gray_situation.png', height: 32),
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
                    children: [
                      Image.asset('assets/images/home.png', height: 44),
                      const SizedBox(height: 10),
                    ],
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
                      Image.asset('assets/images/black_mypage.png', height: 32),
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
