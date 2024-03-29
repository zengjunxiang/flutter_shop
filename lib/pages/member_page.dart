import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class MemberPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    // TODO: implement build
    return Scaffold(


      appBar: AppBar(
        title: Text('会员中心'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      ),

      body: ListView(
        children: <Widget>[

          _topHeader(),
          _orderTitle(),
          _orderType(),
          _actionList()

        ],
      ),

    );
  }


  //顶部头像区域
  Widget _topHeader(){

    return Container(
      child: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 20),
            child: ClipOval(
              child: Image.network('http://blogimages.jspang.com/blogtouxiang1.jpg'),
            ),

      ),

       Container(
         margin: EdgeInsets.only(top: 20),
         child: Provide<Counter>(

           builder: (context,child,counter){
             return Text(
               '胖兄${counter.value}',
               style: Theme.of(context).textTheme.display1,
             );
           },
         ),
       )
        ],
      ),
    );
  }


  //我的订单区域
  Widget _orderTitle(){

    return Container(
      margin: EdgeInsets.only(top:10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:BorderSide(width: 1,color:Colors.black12)
          )
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title:Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );

  }


  //订单区域
  Widget _orderType(){

    return Container(
      margin: EdgeInsets.only(top:5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top:20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.party_mode,
                  size: 30,
                ),
                Text('待付款'),
              ],
            ),
          ),
          //-----------------
          Container(

            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  size: 30,
                ),
                Text('待发货'),
              ],
            ),
          ),
          //-----------------
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  size: 30,
                ),
                Text('待收货'),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  size: 30,
                ),
                Text('待评价'),
              ],
            ),
          ),
        ],
      ),
    );

  }

  //通用ListTile
  Widget _myListTile(String title){

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:BorderSide(width: 1,color:Colors.black12)
          )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }


  Widget _actionList(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('地址管理'),
          _myListTile('客服电话'),
          _myListTile('关于我们'),
        ],
      ),
    );
  }


}