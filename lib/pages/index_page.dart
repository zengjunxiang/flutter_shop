import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {

    _IndexPageState createState() => _IndexPageState();

}

class _IndexPageState extends State<IndexPage>{

 final List<BottomNavigationBarItem> bottomTabs = [

    BottomNavigationBarItem(
      title: Text('首页'),
      icon: Icon(CupertinoIcons.home)
    ),

    BottomNavigationBarItem(
        title: Text('分类'),
        icon: Icon(CupertinoIcons.search)
    ),

    BottomNavigationBarItem(
        title: Text('购物车'),
        icon: Icon(CupertinoIcons.shopping_cart)
    ),

    BottomNavigationBarItem(
        title: Text('会员中心'),
        icon: Icon(CupertinoIcons.profile_circled)
    ),

  ];



 final List  tabBodies = [
   HomePage(),
   CategoryPage(),
   CartPage(),
   MemberPage()
 ];


 int currentIndex= 0;
 var currentPage ;

 @override
  void initState() {
    // TODO: implement initState
   currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(



      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),

      body: currentPage,
    );
  }

}