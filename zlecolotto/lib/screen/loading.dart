import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:zlecolotto/model/latestDrw.dart';
import 'package:zlecolotto/provider/myProvider.dart';
import 'package:zlecolotto/screen/tab_bar_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void initState(){
    super.initState();
    getLottoData();
  }

  void getLottoData() async{

    var lottoJson;

    var lottoUrl = Uri.parse('http://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=${MyProvider.latestDrw}');
    http.Response responseLotto = await http.get(lottoUrl);
    if(responseLotto.statusCode == 200){
      lottoJson = jsonDecode(responseLotto.body);
      print(lottoJson);
    }

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
      return TabBarPage (
        parseLottoData: lottoJson,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFoldingCube(
              color: Colors.indigoAccent,
              size: 60.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text('로또 당첨 확인',
              style: TextStyle(
                  fontFamily: 'tmon',
                  fontSize: 20.0,
                  color: Colors.black87
              ),
            )
          ],
        ),
      ),
    );
  }
}
