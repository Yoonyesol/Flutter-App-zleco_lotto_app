import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WinnigSpotPage extends StatefulWidget {
  const WinnigSpotPage({Key? key}) : super(key: key);

  @override
  void initState(){}
  
  //새로고침 추가

  @override
  _WinnigSpotPageState createState() => _WinnigSpotPageState();
}

class _WinnigSpotPageState extends State<WinnigSpotPage> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://m.dhlottery.co.kr/store.do?method=topStore&pageGubun=L645',
    );
  }
}
