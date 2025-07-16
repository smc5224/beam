import 'package:flutter/material.dart';
import 'film.dart'; // film.dart 파일을 임포트해주세요!
import 'list.dart';
import 'detail_list.dart';
import 'situation.dart';
import 'my.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/beam_logo.png', height: 24),
                // 여기에 GestureDetector 추가
                GestureDetector(
                  onTap: () {
                    // film.dart로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilmPage(),
                      ), // FilmPage는 film.dart에 정의된 위젯 이름이라고 가정
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/film1.png',
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '100',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
            // 상단 인사
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '반가워요, 소원님',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0),
                      Text('청설이 제작에 들어갔어요!', style: TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/image1.png'),
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 투자 목록
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '투자 목록',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListPage(),
                      ), // FilmPage는 film.dart에 정의된 위젯 이름이라고 가정
                    );
                  },
                  child: const Text(
                    '더보기 >',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),

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
                            builder: (context) => const DetailListPage(),
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

            const SizedBox(height: 24),

            // 투자 현황
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '투자 현황',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SituationPage(),
                      ), // FilmPage는 film.dart에 정의된 위젯 이름이라고 가정
                    );
                  },
                  child: const Text(
                    '더보기 >',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.movie, color: Colors.black),
                ),
                title: Text('언젠가는 슬기로운 전공의생활'),
                subtitle: Text('뭐하는 중'),
              ),
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.movie, color: Colors.black),
                ),
                title: Text('언젠가는 ○○○○○○'),
                subtitle: Text('뭐하는 중'),
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
