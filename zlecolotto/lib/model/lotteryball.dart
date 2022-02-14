import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ball {
  Widget getBall(int number){
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: ballColor(number),
        shape: BoxShape.circle, //원 모양
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }

  ballColor(int number){ //번호 별로 다른 색 출력
    if(1 <= number && number <=10){
      Color c = const Color(0xFFfbc400);
      return c;
    } else if(11 <= number && number <=20){
      Color c = const Color(0xff69c8f2);
      return c;
    } else if(21 <= number && number <=30){
      Color c = const Color(0xFFF76D6D);
      return c;
    } else if(31 <= number && number <=40){
      Color c = const Color(0xFFAAAAAA);
      return c;
    } else if(41 <= number && number <=45){
      Color c = const Color(0xFFaed63f);
      return c;
    }
  }
}

