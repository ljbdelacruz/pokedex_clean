


import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClient {
  String userAgent = "";
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
}