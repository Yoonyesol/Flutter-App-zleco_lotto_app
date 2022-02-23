import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zlecolotto/model/allBall.dart';
import 'package:zlecolotto/provider/myProvider.dart';
import 'package:zlecolotto/model/lotteryball.dart';
import 'package:zlecolotto/model/round_select_box.dart';

class WinningNumberPage extends StatefulWidget {
  const WinningNumberPage({Key? key}) : super(key: key);

  @override
  _WinningNumberPageState createState() => _WinningNumberPageState();
}

//여기서 api 한번 더 불러와서 사용해야겠다.. 어쩔 수 없음

class _WinningNumberPageState extends State<WinningNumberPage> {
  Ball ball = Ball();
  bool _isChecked = false;
  List<Widget> ballWidget = [];
  List menuList = [1, 2, 3, 4,5];

  //for(int i = 1; i<46; i++) i

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(//스크롤뷰
        child: Container( //화면 전체
          child: Column(
            children: [
              Center(
                child: Container(//n회차 당첨번호
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    children: [
                      Container( //당첨번호 회차, 날짜
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("회차선택: ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20.0
                                  ),
                                ),
                                RoundSelectBox(drwNo: (MyProvider.drwNo).toString()),
                                //String형태로 넘겨주지 않으면 타입에러 발생
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "제 ${MyProvider.drwNo}회 당첨배출 결과",
                              style: TextStyle(
                                  fontFamily: 'tmon',
                                  color: Colors.black87,
                                  fontSize: 28.0
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${MyProvider.drwNoDate} 추첨",
                              style: TextStyle(
                                  fontFamily: 'tmon',
                                  color: Colors.black87,
                                  fontSize: 17.0
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container( //공 컨테이너
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ball.getBall(MyProvider.drwtNo1),
                                  ball.getBall(MyProvider.drwtNo2),
                                  ball.getBall(MyProvider.drwtNo3),
                                  ball.getBall(MyProvider.drwtNo4),
                                  ball.getBall(MyProvider.drwtNo5),
                                  ball.getBall(MyProvider.drwtNo6),
                                  SvgPicture.asset(
                                    'svg/plus.svg',
                                    width: 16,
                                    height: 16,
                                  ),
                                  ball.getBall(MyProvider.bnusNo),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //밑에는 x
                      Container(//표
                        child: Table(
                          border: TableBorder.all(width: 1, color:Colors.black54),
                          children: [
                            TableRow(children: [
                              Padding(padding: EdgeInsets.all(8),
                              child: Text('총 상금액', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                              Padding(padding: EdgeInsets.all(8),
                              child: Text('${MyProvider.totSellamnt}원', style: TextStyle(fontSize: 18))),
                            ]),
                            TableRow(children: [
                              Padding(padding: EdgeInsets.all(8),
                              child: Text('1등 상금액', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                              Padding(padding: EdgeInsets.all(8),
                              child: Text('${MyProvider.firstWinamnt}원', style: TextStyle(fontSize: 18))),
                            ]),
                            TableRow(children: [
                              Padding(padding: EdgeInsets.all(8),
                              child: Text('1등 당첨인원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                              Padding(padding: EdgeInsets.all(8),
                              child: Text('${MyProvider.firstPrzwnerCo}명', style: TextStyle(fontSize: 18))),
                            ]),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(//버튼 생성
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo
                        ),
                        onPressed: (){showSelectNumberDialog();},
                        label: Text('번호 직접 입력',style: TextStyle(fontSize: 17),),
                        icon: Icon(Icons.app_registration),
                    ),
                    ElevatedButton.icon(
                        onPressed: (){},
                        label: Text('QR코드 입력',style: TextStyle(fontSize: 17),),
                        icon: Icon(Icons.qr_code),
                    ),
                  ],
                ),
              ),
              Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          color: Color(0xffcad9e8),
                          height: 50,
                          child: Center(
                            child: Text(
                              '내 로또번호',
                              style: TextStyle(
                                  fontFamily: 'tmon',
                                  fontSize: 20
                              ),
                            ),
                          ),
                        )
                    ),
                  ]),
              Column(//사용자 로또
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    alignment: Alignment.bottomLeft, //왼쪽하단에 컨테이너 배치
                    child: Text(
                      '1000회',
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: "tmon"
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.black38,),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Checkbox(
                                    value: _isChecked,
                                    onChanged: (value){
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    }
                                ),
                                Text(
                                  "1     4     6     31     23     3",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "tmon"
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 40,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '당첨',
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "tmon"
                                      )
                                    ),
                                  ),
                                )
                              ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.bottomLeft, //왼쪽하단에 컨테이너 배치
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black38,
                  ),
                  onPressed: (){},
                  child: Text('선택삭제',style: TextStyle(fontSize: 15),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSelectNumberDialog() {
    showDialog(
      context: context,
      builder: (context){
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: new Text("번호 직접 입력"),
              content: Container(
                child: allBall(),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new ElevatedButton(
                      child: new Text("저장"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    new ElevatedButton(
                      child: new Text("취소"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            );
        },);
      }

    );
  }
}
