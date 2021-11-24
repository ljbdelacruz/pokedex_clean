


import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClient {
  String userAgent = "Dart/8396d73bcd290";
  Dio dio;
  RestClient(){
    this.dio=Dio();
  }


  Dio getDioDebugging(){
    Dio ddio = new Dio();
    ddio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          request: true,
          maxWidth: 128,
          error: true,
          responseBody: true),
    );
    return ddio;
  }

  Map<String, dynamic> loginHeader(){
    return {
      "Content-Type":"application/x-www-form-urlencoded",
      "Accept":"application/json",
      "User-Agent":userAgent,
    };
  }


  Map<String, dynamic> authHeader(String type, String token){
    return {
      "Content-Type":"application/x-www-form-urlencoded",
      "Authorization": type+" "+token,
      "User-Agent":userAgent,
    };
  }



}