import 'package:flutter/cupertino.dart';
import 'package:zlecolotto/model/lotteryball.dart';

Container allBall(){
  Ball ball = Ball();

  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 1; i <= 5; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 6; i <= 10; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 11; i <= 15; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 16; i <= 20; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 21; i <= 25; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 26; i <= 30; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 31; i <= 35; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 36; i <= 40; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(int i = 41; i <= 45; i++)
                  GestureDetector(
                    onTap: (){
                      print('선택');
                    },
                    child: ball.getBall(i),
                  ),
              ]
          ),
        ],
      )
  );
}