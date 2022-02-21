import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zlecolotto/provider/myProvider.dart';
import 'package:zlecolotto/screen/tab_bar_page.dart';

class RoundSelectBox extends StatefulWidget {
  RoundSelectBox({required this.drwNo});
  final String drwNo;

  @override
  _RoundSelectBoxState createState() => _RoundSelectBoxState();
}

class _RoundSelectBoxState extends State<RoundSelectBox> {
  late String dropdownvalue;
  List<String> items = []; //List 타입을 명시해주지 않으면 dynamic타입으로 인식해 오류발생함


  void initState(){
    super.initState();
    updateData(widget.drwNo);
  }

  void updateData(String drwNo){
    dropdownvalue = widget.drwNo;
    items = [for (var i = MyProvider.latestDrw; i > 0; i--) '$i'];
  }
    
    @override
    Widget build(BuildContext context) {
      return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items,
                    style: TextStyle(
                      fontSize: 19,
                    ),),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() async {
                    dropdownvalue = newValue!;

                    var lottoJson;

                    var lottoUrl = Uri.parse('http://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=${int.parse(newValue)}');
                    http.Response responseLotto = await http.get(lottoUrl);
                    if(responseLotto.statusCode == 200){
                      lottoJson = jsonDecode(responseLotto.body);
                    }

                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return TabBarPage (
                        parseLottoData: lottoJson,);
                    }));
                  });
                },
              ),
            ],
          ),
        );
    }
  }
