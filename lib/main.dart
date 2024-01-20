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
        appBar: AppBar(title: Text('메뉴정해밥')),
        body: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,  //행렬 열 개수
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if(index != 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextScreen(
                            imagePath: imagePaths[index],
                            index: index,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    )
                  ),
                  child: Center(
                    child: Text(
                      imagePaths[index],
                      style: TextStyle(
                        fontSize: 24, // 원하는 글자 크기로 설정합니다.
                        fontWeight: FontWeight.bold, // 글자를 두껍게 표시합니다.
                      ),
                    ),
                  ),
                )
              );
            },
          )
        )
    );
  }
}

class NextScreen extends StatelessWidget {
  final String imagePath;
  final int index;

  NextScreen({
    required this.imagePath,
    required this.index,
  });

  List<String> getListByNumber(int index) {
    switch (index) {
      case 0:
        return list_1; // Replace this with the appropriate list you want to use
      case 1:
        return list_2; // Replace this with the appropriate list you want to use
      case 2:
        return list_3; // Replace this with the appropriate list you want to use
      case 3:
        return list_4; // Replace this with the appropriate list you want to use
      case 4:
        return list_5; // Replace this with the appropriate list you want to use
      case 5:
        return list_6; // Replace this with the appropriate list you want to use
      case 6:
        return list_7; // Replace this with the appropriate list you want to use
      case 7:
        return list_8; // Replace this with the appropriate list you want to use
      case 8:
        return list_9; // Replace this with the appropriate list you want to use
    // Add more cases if you have more lists.
      default:
        return []; // Return an empty list for the default case or handle it as needed.
    }
  }

  void _showAlertDialog(BuildContext context, String selectedMenu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('선택완료'),
          content: Text('결정! 오늘 메뉴는 ' + selectedMenu + '입니다'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // AlertDialog 닫기
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> selectedList = getListByNumber(index);

    return Scaffold(
      appBar: AppBar(title: Text('메뉴정해밥')),
      // body: Center(
      //   child: Text(
      //     imagePath,
      //     style: TextStyle(
      //       fontSize: 24, // 원하는 글자 크기로 설정합니다.
      //       fontWeight: FontWeight.bold, // 글자를 두껍게 표시합니다.
      //     ),
      //   ),
      // ),
        body: Center(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,  //행렬 열 개수
              ),
              itemCount: selectedList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      _showAlertDialog(context, selectedList[index].toString()); // AlertDialog 표시
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          )
                      ),
                      child: Center(
                        child: Text(
                          selectedList[index],
                          style: TextStyle(
                            fontSize: 24, // 원하는 글자 크기로 설정합니다.
                            fontWeight: FontWeight.bold, // 글자를 두껍게 표시합니다.
                          ),
                        ),
                      ),
                    )
                );
              },
            )
        )
    );
  }
}

//한식
final List<String> list_1 = [
  '불고기',
  '오징어두루치기',
  '닭볶음',
  '쌈밥',
  '비빔밥',
  '생선구이',
  '낙지볶음',
  '게장',
  '떡갈비',
];
//탕_찌개
final List<String> list_2 = [
  '김치찌개',
  '순두부찌개',
  '된장찌개',
  '부대찌개',
  '동태찌개',
  '청국장',
  '갈비탕',
  '추어탕',
  '삼계탕',
];
//중식
final List<String> list_3 = [
  '짜장면',
  '짬뽕',
  '볶음밥',
  '탕수육',
  '마파두부',
  '양장피',
  '깐풍기',
  '유린기',
  '고추잡채',
];
//일식
final List<String> list_4 = [
  '초밥',
  '라멘',
  '낫또',
  '오니기리',
  '덮밥',
  '우동',
  '야키니쿠',
  '메밀소바',
  '돈카츠',
];
//양식
final List<String> list_5 = [
];
//양식
final List<String> list_6 = [
  '토마토스파게티',
  '봉골레',
  '크림파스타',
  '피자',
  '함박스테이크',
  '리조또',
  '스테이크',
  '햄버거',
  '시저샐러드',
];
//해장
final List<String> list_7 = [
  '북엇국',
  '콩나물국밥',
  '순대국',
  '뼈해장국',
  '우거지국',
  '선지해장국',
  '올갱이국',
  '매운라면',
  '물냉면',
];
//간편식
final List<String> list_8 = [
  '도시락',
  '샌드위치',
  '토스트',
  '샐러드',
  '김밥',
  '떡볶이',
  '핫도그',
  '밥버거',
  '시리얼',
];


final List<String> list_9 = [
  '쌀국수',
  '팟타이',
  '카레',
  '찜닭',
  '수제비',
  '칼국수',
  '아구찜',
  '닭갈비',
  '월남쌈',
];