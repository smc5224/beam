import 'package:flutter/material.dart';

final int participantCount = 632;
final int amount = 100000000;
final int myFilm = 100;
final int recoveryStep = 7;

final List<String> recoveryLabels = [
  '기획 중',
  '준비 중',
  '촬영 중',
  '편집 중',
  '배급 중',
  '공개 중',
  '정산 중',
  '회수 완료',
];

class DetailSituationPage extends StatelessWidget {
  const DetailSituationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String popcornImage = recoveryStep == 0
        ? 'assets/images/popcorn_empty.png'
        : (recoveryStep < 7
            ? 'assets/images/popcorn_step$recoveryStep.png'
            : 'assets/images/popcorn_full.png');

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
                                    text: '${amount.toString()}',
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
                          Image.asset('assets/images/mdi_film.png', width: 24, height: 24),
                          const SizedBox(width: 4),
                          Text('$myFilm', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    )
                  ],
                ),
                const SectionDivider(),
                RecoveryProgressBar(currentStep: recoveryStep, stepLabels: recoveryLabels),
                const SectionTitle('투자금 회수 상태'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PopcornRecoverySection(imagePath: popcornImage),
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
      thickness: 4,
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
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}

class RecoveryProgressBar extends StatelessWidget {
  final int currentStep;
  final List<String> stepLabels;
  const RecoveryProgressBar({super.key, required this.currentStep, required this.stepLabels});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('진행 상태', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 1, // 정말 얇은 선
                  color: const Color(0xFFE0E0E0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(stepLabels.length, (index) {
                  final isCurrent = index == currentStep;
                  return Column(
  children: [
    Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.red : Colors.white,
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle,
      ),
    ),
    const SizedBox(height: 1),
    Text(
      stepLabels[index],
      style: TextStyle(
        fontSize: 12,
        color: isCurrent ? Colors.red : Colors.transparent, // 안 보이게
      ),
    ),
  ],
);

                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PopcornRecoverySection extends StatefulWidget {
  final String imagePath;
  const PopcornRecoverySection({super.key, required this.imagePath});

  @override
  State<PopcornRecoverySection> createState() => _PopcornRecoverySectionState();
}

class _PopcornRecoverySectionState extends State<PopcornRecoverySection> {
  bool isCovered = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(widget.imagePath),
        ),
        if (isCovered)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        if (isCovered)
          Positioned.fill(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isCovered = false;
                  });
                },
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
            ),
          ),
      ],
    );
  }
}