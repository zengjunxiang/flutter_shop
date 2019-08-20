import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';
import '../config/service_url.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget{

    _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  String homePageContent = '还没有请求数据';

  @override
  void initState() {
    // TODO: implement initState
    getHomePageContent().then((val) {
      setState(() {
        homePageContent = val.toString();
      });
    });


    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),

      body: SingleChildScrollView(
        child: Text(homePageContent),
      ),

    );
  }

}



