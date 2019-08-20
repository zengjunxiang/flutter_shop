import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

     return Container(
       child: MaterialApp(
         title: '百姓生活+title',
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           primaryColor: Colors.greenAccent
         ),

         home: IndexPage(),
       ),

     );

  }
}


