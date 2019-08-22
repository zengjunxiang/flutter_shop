import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'dart:convert';
import '../service/service_method.dart';
import '../model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {

  _CategoryPageState createState() => _CategoryPageState();

}


class _CategoryPageState extends State {


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),

          ],
        ),
      ),
    );
  }
  }






class LeftCategoryNav extends StatefulWidget {

  _LeftCategoryNavState createState() => _LeftCategoryNavState();

}

class _LeftCategoryNavState  extends State<LeftCategoryNav>{


  List list = [];
  var listIndex = 0; //索引

  void _getCategory() async {

    await request('getCategory').then((val) {
      var data = json.decode(val.toString());

      CategoryBigListModel categoryBigListModel = CategoryBigListModel.fromJson(data['data']);
      categoryBigListModel.data.forEach((item)=> print(item.mallCategoryName)) ;
      print(data);

      setState(() {
        list = categoryBigListModel.data;
      });
    });
  }


@override
  void initState() {
    // TODO: implement initState
    _getCategory();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Container(

      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(width: 1,color:Colors.black12)
          )
      ),


      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            return _leftInkWel(index);
          }
      ),

    );
  }

  Widget  _leftInkWel(int index){

    bool isClick=false;
    isClick=(index==listIndex)?true:false;

    return InkWell(

      onTap: (){
        print('点击了');
      },
      child: Container(

        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick?Color.fromRGBO(236, 238, 239, 1.0):Colors.white,
            border:
            Border(bottom: BorderSide(width: 1, color: Colors.black12))),

        child: Text(list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),

      ),


    ),
    );

  }

}


