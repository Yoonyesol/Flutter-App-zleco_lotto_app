import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zlecolotto/model//lotteryball.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({Key? key, parseLottoData}) : super(key: key);

  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> with TickerProviderStateMixin {
  Ball ball = Ball();
  late final AnimationController _animationController;
  var randomNumber = [1, 1, 1, 1, 1, 1];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Lottie.asset('svg/roulette.json',
              height: 200,
              animate: true,
              controller: _animationController,
              onLoaded: (composition) {
                _animationController.duration = composition.duration;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              onPressed: (){
                _animationController.animateTo(75);
                randomNumber = lottoNumber();
              },
              child: Text('룰렛 돌리기',style: TextStyle(fontSize: 18),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for(var i in randomNumber) ball.getBall(i)

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.bottomRight, //쪽하단에 컨테이너 배치
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                onPressed: (){},
                child: Text('번호 저장',style: TextStyle(fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<int> lottoNumber(){
  var number = (List<int>.generate(45, (i) =>
  i+1)..shuffle()).sublist(0,7);

  print('당첨번호');
  print(number);

  return number;
}