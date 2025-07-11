import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BEAM',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
  preferredSize: const Size.fromHeight(300),
  child: SafeArea(
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/beam_logo.png',
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/mdi_film.png',
                  height: 16, // 원하면 사이즈 조절
                  color: Colors.white, // 흰색 tint 입히고 싶으면
                ),
                const SizedBox(width: 4),
                const Text(
                  '100',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold,),
                ),
              ],
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
                      Text('청설이 제작에 들어갔어요!',
                      style: TextStyle(
                          fontSize: 22,
                          
                        ),
                       ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/image1.png'),
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
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    GestureDetector(
      onTap: () {
        print('더보기 클릭됨');
        // Navigator.push(...) 등으로 페이지 이동 처리 가능!
      },
      child: const Text(
        '더보기 >',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    ),
  ],
),
            const SizedBox(height: 10),

            Card(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/banner.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '언젠가는 슬기로운 전공의생활',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('주연배우 - 고윤정, 정준원, 신시아'),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(200, 200, 200, 1),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('자세히 보기'),
                          ),
                        ),
                      ],
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
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(width: 10),
    GestureDetector(
      onTap: () {
        print('더보기 클릭됨');
        // Navigator.push(...) 등으로 페이지 이동 처리 가능!
      },
      child: const Text(
        '더보기 >',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
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
    height: 72, // 충분한 높이!
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/shop.png', height: 32),
              const SizedBox(height: 4),
              const Text('투자 현황', style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/Frame 4.png', height: 44),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/mypage.png', height: 32),
              const SizedBox(height: 4),
              const Text('마이페이지', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    ),
  ),
),


    );
  }
}
