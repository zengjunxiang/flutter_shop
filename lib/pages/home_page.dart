import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../config/httpHeaders.dart';
import '../config/service_url.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
            String  advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
            String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
            String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话
            List<Map> recommendList = (data['data']['recommend'] as List).cast(); // 商品推荐

            if(navigatorList.length>10){
                navigatorList.removeRange(10, navigatorList.length);
            }

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList:swiperDataList), //轮播组件
                  TopNavigator(navigatorList:navigatorList),  //导航组件
                  AdBanner(advertesPicture:advertesPicture),  //广告组件
                  LeaderPhone(leaderImage:leaderImage,leaderPhone:leaderPhone),
                  Recommend(recommendList:recommendList),
                ],
              ),
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

//GirdView 类别导航功能
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

      height: ScreenUtil().setHeight(260),
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

//Ad 广告功能的实现
class AdBanner extends StatelessWidget{


  final String advertesPicture;

  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.network(advertesPicture),

    );
  }



}


//拨打电话组件的实现
class LeaderPhone extends StatelessWidget{

  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key,this.leaderImage, this.leaderPhone}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }


  void _launchURL() async{

    String url = 'tel:'+leaderPhone;

    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }


}


//商品推荐
class Recommend extends StatelessWidget {
  final List  recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList()
        ],
      ),
    );
  }

//推荐商品标题
  Widget _titleWidget(){
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
        decoration: BoxDecoration(
            color:Colors.white,
            border: Border(
                bottom: BorderSide(width:0.5,color:Colors.black12)
            )
        ),
        child:Text(
            '商品推荐',
            style:TextStyle(color:Colors.pink)
        )
    );
  }

  Widget _recommedList(){

    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context,index){
          return _item(index);
        },
      ),
    );
  }

  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration:BoxDecoration(
            color:Colors.white,
            border:Border(
                left: BorderSide(width:0.5,color:Colors.black12)
            )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color:Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}




