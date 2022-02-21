import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zlecolotto/screen/menu_page.dart';
import 'package:zlecolotto/screen/random_number_page.dart';
import 'package:zlecolotto/screen/winnig_number_page.dart';
import 'package:zlecolotto/screen/winningspot_page.dart';
import 'package:zlecolotto/provider/myProvider.dart';

import 'my_number_page.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({this.parseLottoData});
  final dynamic parseLottoData;

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final tabItems = ['당첨번호', '내 번호 관리', '로또번호 생성', '1등 당첨점', '설정'];

  void initState(){
    super.initState();
    updateData(widget.parseLottoData);
  }

  var f = NumberFormat('###,###,###,###'); //숫자 세자리씩 끊기

  void updateData(dynamic LottoData){
    MyProvider.drwNoDate = LottoData['drwNoDate'];
    MyProvider.totSellamnt = f.format(LottoData['totSellamnt']);
    MyProvider.firstWinamnt = f.format(LottoData['firstWinamnt']);
    MyProvider.firstPrzwnerCo = LottoData['firstPrzwnerCo'];
    MyProvider.firstAccumamnt = f.format(LottoData['firstAccumamnt']);
    MyProvider.drwtNo1 = LottoData['drwtNo1'];
    MyProvider.drwtNo2 = LottoData['drwtNo2'];
    MyProvider.drwtNo3 = LottoData['drwtNo3'];
    MyProvider.drwtNo4 = LottoData['drwtNo4'];
    MyProvider.drwtNo5 = LottoData['drwtNo5'];
    MyProvider.drwtNo6 = LottoData['drwtNo6'];
    MyProvider.bnusNo = LottoData['bnusNo'];
    MyProvider.drwNo = LottoData['drwNo'];
  }

  Future<bool> _onBackPressed(){ //뒤로가기
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("종료하시겠습니까?"),
        actions: <Widget>[
          ElevatedButton(
            child: Text("종료"),
            onPressed: () => Navigator.pop(context, true),
          ),
          ElevatedButton(
            child: Text("돌아가기"),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: DefaultTabController(
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
      ),
    );
  }
}

