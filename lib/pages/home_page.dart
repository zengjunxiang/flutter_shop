import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';
import '../config/service_url.dart';

class HomePage extends StatefulWidget{

    _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  TextEditingController typeController = TextEditingController();
  String showText = '还没有请求数据';


  @override
  Widget build(BuildContext context) {

    return Container(

      child: Scaffold(


        body: SingleChildScrollView(

          child: Column(
            children: <Widget>[

              RaisedButton(
                child: Text('请求数据'),
                color: Color.fromRGBO(0, 200, 200, 1.0),
                onPressed: _jike,
              ),

              Text(
               showText,

              ),

            ],

          ),

        ),

      ),

    );

  }



  void _jike(){

    print('开始请求数据............');
    getHttp().then((val){
      setState(() {
        showText=val['data'].toString();
      });
    });
  }


  Future  getHttp() async{
    Response response;

    Dio dio = new Dio();
        dio.options.headers = httpHeader;
    try {
      response = await dio.get(
          "https://time.geekbang.org/serv/v1/column/newAll"
      );
      print(response);
      return response.data;
    }catch(e){
      return print(e);
    }
  }


}



