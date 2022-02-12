import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ball {
  Widget getBall(){
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
        color: Color(0xff69c8f2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "1",
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}

