import 'package:flutter/material.dart';

class FilmPage extends StatelessWidget {
  const FilmPage({super.key});

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
                    '필름 환전소',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Column(
          children: [
            // 첫 번째 카드: 10 SEED 무료
            _buildFilmExchangeCard(
              context,
              'assets/images/film_10.png', // 필름 아이콘 이미지 경로 (pubspec.yaml에 등록되어야 함)
              '10 필름',
              '무료',
              isFree: true,
            ),
            const SizedBox(height: 12), // 카드 간 간격

            // 두 번째 카드: 100 필름 1,000원
            _buildFilmExchangeCard(
              context,
              'assets/images/film_100.png', // 동일한 아이콘 사용 가정
              '100 필름',
              '1,000원',
            ),
            const SizedBox(height: 12),

            // 세 번째 카드: 1100 필름 10,000원
            _buildFilmExchangeCard(
              context,
              'assets/images/film_1100.png', // 동일한 아이콘 사용 가정
              '1100 필름',
              '10,000원',
            ),
            const SizedBox(height: 12),

            // 네 번째 카드: 11000 필름 100,000원
            _buildFilmExchangeCard(
              context,
              'assets/images/film_11000.png', // 동일한 아이콘 사용 가정
              '11000 필름',
              '100,000원',
            ),
          ],
        ),
      ),
    );
  }

  // 필름 환전 카드 위젯을 생성하는 헬퍼 함수
  Widget _buildFilmExchangeCard(
    BuildContext context,
    String imagePath,
    String amountText,
    String priceText, {
    bool isFree = false,
    double iconScale = 1.0, // 아이콘 크기 조절을 위한 스케일 인수
  }) {
    return Card(
      color: Colors.white,
      elevation: 1, // 그림자 없음
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // 둥근 모서리
      ),
      child: InkWell( // 카드 전체를 탭 가능하게
        onTap: () {
          print('$amountText ($priceText) 카드 클릭됨!');
          if (isFree) {
            _showSnackBar(context, '$amountText 무료 획득!');
          } else {
            _showSnackBar(context, '$amountText 구매 프로세스 시작!');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Row(
            children: [
              // 필름 아이콘
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(100),

                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    width: 50 * iconScale,
                    height: 50 * iconScale,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // 수량 텍스트
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amountText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF737373),
                        fontFamily: 'Pretendard',
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      priceText,
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ],
                ),
              ),

              // "획득하기" / "구매하기" 텍스트와 화살표 아이콘
              Row(
                children: [
                  Text(
                    isFree ? '획득하기' : '구매하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF000000),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFF000000),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 스낵바를 보여주는 헬퍼 함수
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}