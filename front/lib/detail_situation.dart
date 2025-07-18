import 'package:flutter/material.dart';

final int participantCount = 632;
final int amount = 100000000;
final int myFilm = 100;
final int recoveryStep = 8; // 1~8 단계로 팝콘 상태 표현 가능 (예: 8이면 회수 완료)

class DetailSituationPage extends StatelessWidget {
  const DetailSituationPage({super.key});

  @override
  Widget build(BuildContext context) {

    String popcornImage = 'assets/images/popcorn_full.png'; // 기본 회수 완료

    // 회수 단계에 따른 팝콘 이미지 파일명 설정
    if (recoveryStep < 8 && recoveryStep >= 1) {
      popcornImage = 'assets/images/popcorn_step$recoveryStep.png';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 50, bottom: 12, left: 16, right: 16),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '세부 현황',
                    style: TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pretendard',
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF1C1C1C)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/investment_banner.png'),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '언젠가는 슬기로운 전공의생활',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text('주연배우 - 고윤정, 정조원, 신시아', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${participantCount.toString()}',
                                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFF4141)),
                                  ),
                                  const TextSpan(
                                    text: '명 참여',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFF4141)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:  '${amount.toString()}',
                                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                  const TextSpan(
                                    text: '원 달성',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SectionDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('내가 투자한 필름', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        children: [
                          Text('$myFilm', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 4),
                          Image.asset('assets/images/film2.png', width: 24, height: 24),
                        ],
                      ),
                    )
                  ],
                ),
                const SectionDivider(),
                const SectionTitle('투자금 회수 상태'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(popcornImage),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        ),
                        child: const Text(
                          '투자금 회수하기',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 32,
      thickness: 7,
      color: Color(0xFFF6F6F6),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
