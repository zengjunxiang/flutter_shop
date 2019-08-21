import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text('会员中心'),
      ),

      body: ListView(
        children: <Widget>[

          _topHeader(),

        ],
      ),

    );
  }


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
           fontSize: ScreenUtil().setSp(48),
           color: Colors.grey,
         ),),
       )
        ],
      ),
    );
  }


}