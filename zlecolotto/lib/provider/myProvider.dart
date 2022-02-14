import 'package:flutter/cupertino.dart';
import 'package:zlecolotto/model/latestDrw.dart';

class MyProvider with ChangeNotifier{
  static var drwNoDate; // 날짜
  static var totSellamnt; // 총상금액
  static var firstWinamnt; //1등 상금액
  static var firstPrzwnerCo; //1등 당첨인원
  static var firstAccumamnt; //1등 당첨금 총액
  static var drwtNo1;
  static var drwtNo2;
  static var drwtNo3;
  static var drwtNo4;
  static var drwtNo5;
  static var drwtNo6;
  static var bnusNo; //로또 보너스 번호
  static var drwNo; //로또 회차

  static int latestDrw = getLatestEpisodeBasedonDate(); //최신 회차
}