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
            List<Map> navigatorList =(data['data']['category'] as List).cast(); //类别列表


            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList:swiperDataList), //轮播组件
                TopNavigator(navigatorList:navigatorList),  //导航组件
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


// 顶部轮播图
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

class TopNavigator  extends StatelessWidget{

   final List navigatorList;

   TopNavigator({Key key, this.navigatorList}) : super(key: key);



   Widget _gridViewItemUI(BuildContext buildContext,item){


     return InkWell(

       onTap: (){print('点击了导航');},
       child: Column(
         children: <Widget>[
           Image.network(item['image'],width:ScreenUtil().setWidth(95)),
           Text(item['mallCategoryName'])
         ],
       ),

     );

   }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(4.0),
          children: navigatorList.map((item){
            return _gridViewItemUI(context,item);
          }).toList(),
      )

    );
  }




}




