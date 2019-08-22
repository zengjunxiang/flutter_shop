import 'package:flutter/material.dart';
import 'package:flutter_shop/config/service_url.dart';
import 'dart:convert';
import '../service/service_method.dart';

class CategoryPage extends StatefulWidget {

  _CategoryPageState createState() => _CategoryPageState();

}


class _CategoryPageState extends State {

  @override
  Widget build(BuildContext context) {

    _getCategory();

    // TODO: implement build
    return Container(
      child:Center(
          child: Text('fen'),
      ),
    );
  }


  void _getCategory() async {

    await request('getCategory').then((val) {
                 var data = json.decode(val.toString());
                    print(data);
    });
  }


}