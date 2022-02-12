import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zlecolotto/model/lotteryball.dart';

class MyNumberPage extends StatefulWidget {
  const MyNumberPage({Key? key}) : super(key: key);

  @override
  _MyNumberPageState createState() => _MyNumberPageState();
}

class _MyNumberPageState extends State<MyNumberPage> {
  Ball ball = Ball();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
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
    );
  }
}
