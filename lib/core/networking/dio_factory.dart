import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_weather/core/helper/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String multipart = "multipart/form-data";
const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeOut =
        const Duration(milliseconds: Constants.apiTimeOute); // a min time out
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: authorization,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      sendTimeout: timeOut,
      receiveTimeout: timeOut,
    );
    if (!kReleaseMode) {
      //its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true));
    }
    return dio;
  }
}
