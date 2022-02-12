import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zlecolotto/screen/menu_page.dart';
import 'screen/my_number_page.dart';
import 'screen/random_number_page.dart';
import 'screen/winnig_number_page.dart';
import 'screen/winningspot_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lotto',
      home: LottoMain(),
    );
  }
}

class LottoMain extends StatefulWidget {
  const LottoMain({Key? key}) : super(key: key);

  @override
  _LottoMainState createState() => _LottoMainState();
}

class _LottoMainState extends State<LottoMain> {
  final tabItems = ['당첨번호', '내 번호 관리', '로또번호 생성', '1등 당첨점', '설정'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              '로또 당첨 확인',
              style: TextStyle(
                  fontFamily: 'tmon',
                  color: Colors.black87,
                  fontSize: 20.0
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            bottom: TabBar(
              //map함수: 리스트 요소를 하나씩 전달한 결과
              //Iterable 객체를 생성하므로 toList()함수로 변환
              tabs: tabItems.map((String choice){
                return Tab(child: Text(
                  choice,
                  style: TextStyle(
                      fontFamily: 'tmon',
                      color: Colors.black87,
                      fontSize: 17.0
                  ),
                ),
                );
              }).toList(),
              isScrollable: true,
            ),

          ),
          body: TabBarView(
            children: [WinningNumberPage(), MyNumberPage(),
              RandomNumberPage(), WinnigSpotPage(),
              MenuPage()
            ])
      ),
    );
  }
}
