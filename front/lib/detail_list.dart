import 'package:flutter/material.dart';

final int participantCount = 632;
final int amount = 100000000;

class DetailListPage extends StatelessWidget {
  const DetailListPage({super.key});

  @override
  Widget build(BuildContext context) {

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
                    '상세 정보',
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
                      const Text('주연배우 - 고윤정, 정조원, 신시아',
                      style: TextStyle(fontSize: 16),),
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
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF4141),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '명 참여',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,

                                      color: Color(0xFFFF4141),
                                    ),
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
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '원 달성',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
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
                const SectionTitle('상세 정보'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      InfoRow(label: '제작사', value: '에고이즈커머스'),
                      InfoRow(label: '연출', value: '이민수, 신의호'),
                      InfoRow(label: '작가', value: '김승희, 이유정'),
                      InfoRow(label: '출연', value: '고윤정, 신시아, 강윤석, 한예지'),
                    ],
                  ),
                ),
                const SectionDivider(),
                const SectionTitle('줄거리'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '\'언젠가는 슬기로운\' 의사생활을 꿈꾸는 레지던트들이\n'
                    '입덕부정기를 거쳐 성장해 나가는 과정을 담은\n'
                    '슬기로운 의사생활 스핀오프 드라마',
                    style: TextStyle(height: 1.5),
                  ),
                ),
                const SectionDivider(),
                const SectionTitle('투자 정보'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      InfoRow(label: '제작기간', value: '2023년 10월 ~ 2024년 5월'),
                      InfoRow(label: '예상 투자 회수 기간', value: '3년'),
                      InfoRow(label: '최소 투자 금액', value: '200 필름'),
                      InfoRow(label: '목표 금액', value: '100,000,000원'),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 6,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '투자하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '??? 필름부터',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          // 왼쪽 라벨 (30~40%)
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Pretendard',
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
          const SizedBox(width: 12),
          // 오른쪽 값 (60~70%)
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Pretendard',
              ),
            ),
          ),
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
      color: Color(0xFFFF6F6F6),
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
