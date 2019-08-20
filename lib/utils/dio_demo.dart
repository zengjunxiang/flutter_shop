import 'package:dio/dio.dart';

void getHttp() async{
    Response response;

    try {

      var data={'name':'技术胖'};

      response = await Dio().get(
        "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name = 大胸美女",
        //  queryParameters:data
      );

      return  print(response);

    }catch(e){

      return print(e);
    }
}