import 'package:intl/intl.dart';

getLatestEpisodeBasedonDate(){
  String startDate = "2002-12-07 23:59:59";
  DateTime sDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(startDate);
  DateTime cDate = new DateTime.now();
  int diff = cDate.millisecondsSinceEpoch - sDate.millisecondsSinceEpoch;

  double nextEpi = (diff / (86400 * 1000 * 7))+2; //다음 회차
  double currentEpi = (diff / (86400 * 1000 * 7))+1; //이번 회차

  if(cDate.weekday == 6){ //토요일
    if(cDate.hour >= 21){ //오후 9시 이후
      return nextEpi.toInt(); //다음 회차
    }else { //오후 9시 이전
      return currentEpi.toInt(); //최신 회차
    }
  } else if(cDate.weekday == 7) { //일요일
    return nextEpi.toInt();
  } else {//토, 일요일이 아닐 때
    return currentEpi.toInt(); //최신 회차
  }
}