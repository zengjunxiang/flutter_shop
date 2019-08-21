import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('会员中心'),
      ),

      body: ListView(
        children: <Widget>[

          _topHeader(),
          _orderTitle(),

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
         child: new Text('胖兄',
         style: new TextStyle(
           fontSize: ScreenUtil().setSp(24),
           color: Colors.grey,
         ),),
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



}