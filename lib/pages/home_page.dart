import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../config/httpHeaders.dart';
import '../config/service_url.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget{
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text('百姓生活+'),
      ),

      body: FutureBuilder(

        future: getHomePageContent(),
        builder: (context,snapshot){

          if(snapshot.hasData){

            var data=json.decode(snapshot.data.toString());
            List<Map> swiperDataList = (data['data']['slides'] as List).cast(); // 顶部轮播组件数


            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList:swiperDataList),
              ],
            );


          }else{
            return Center (
              child: Text('加载中'),
            );
          }
        },
      ),
    );
  }

}


class SwiperDiy extends StatelessWidget{

  final List swiperDataList;

  SwiperDiy({Key key ,this.swiperDataList}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    return Container(
       height: ScreenUtil().setHeight(333),
       width: ScreenUtil().setWidth(750),
      child: Swiper(

          itemBuilder: ( BuildContext context,int index){
            return Image.network("${swiperDataList[index]['image']}",fit: BoxFit.fill);
          },

          itemCount: swiperDataList.length,
          pagination: new SwiperPagination(),
          autoplay: true,


      ),

    );
  }




}




