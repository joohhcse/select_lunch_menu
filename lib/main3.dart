import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  final List<String> imagePaths = [
    '한식',
    '탕/찌개',
    '중식',
    '일식',
    '?',
    '양식',
    '해장',
    '간편식',
    '기타',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('메뉴정해줌')),
        body: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 버튼1 동작
                      },
                      child: Text('Button 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 버튼2 동작
                      },
                      child: Text('Button 2'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NextScreen(imagePath: imagePaths[index]),
                              ),
                            );
                          },
                          // child: Image.asset(imagePaths[index]),
                          child: Center(
                            child: Text(
                              imagePaths[index],
                              style: TextStyle(
                                fontSize: 20, // 원하는 글자 크기로 설정합니다.
                                fontWeight: FontWeight.bold, // 글자를 두껍게 표시합니다.
                              ),
                            ),
                          ),
                        );
                      },
                    )
                )
              ],
            )
        )
    );
  }
}

class NextScreen extends StatelessWidget {
  final String imagePath;

  NextScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메뉴정해줌')),
      body: Center(
        child: Text(
          imagePath,
          style: TextStyle(
            fontSize: 24, // 원하는 글자 크기로 설정합니다.
            fontWeight: FontWeight.bold, // 글자를 두껍게 표시합니다.
          ),
        ),
      ),
    );
  }
}
