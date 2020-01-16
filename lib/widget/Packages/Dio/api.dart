//https://pub.flutter-io.cn/packages/dio
//https://github.com/flutterchina/dio/blob/master/README-ZH.md

import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';

Dio dio = Dio();
//GET
Future Get(url, {formData}) async {
  try {
    Response response;
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();

    //发起GET请求 传入url及表单参数
    response = await dio.get(url,queryParameters: formData);
    //成功返回
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print('error:::${e}');
  }
}

//POST
Future Post(url, {formData}) async {
  try {
    Response response;
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();

    //发起POST请求 传入url及表单参数
    response = await dio.post(url, data: formData);
    //成功返回
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('接口异常');
    }
  } catch (e) {
    return print('error:::${e}');
  }
}