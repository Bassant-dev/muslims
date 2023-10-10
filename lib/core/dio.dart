import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio1;
  static late Dio dio2;
  static late Dio dio3;

  static init1() {
    dio1 = Dio(BaseOptions(
      baseUrl: 'https://api.aladhan.com/v1/timings/',
      receiveDataWhenStatusError: true,
    ));
  }
  static init2() {
    dio2 = Dio(BaseOptions(baseUrl: 'http://api.alquran.cloud/v1/',
    ));
  }
  static Init3() {
    dio3 = Dio(BaseOptions(
      baseUrl: 'https://ahegazy.github.io/muslimKit/json/',
      receiveDataWhenStatusError: true,
    ));
  }


  static Future<Response> getData(
      {
        required String url,
        Map<String, dynamic>? query,
        String? token
      }) async {

    dio1.options.headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio1.get(url, queryParameters: query);
  }



  static Future<Response> getData2(
      {
        required String url,
        Map<String, dynamic>? query,
        String? token
      }) async {

    dio2.options.headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio2.get(url, queryParameters: query);
  }
  static Future<Response> getDataAzkar(
      {
        required String url,
        Map<String, dynamic>? query,
        String? token
      }) async {

    dio3.options.headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio3.get(url, queryParameters: query);
  }
  // Future<Response> getData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   String? token,
  // }) async {
  //   dio.options.headers = {
  //     'Authorization': 'Bearer $token',
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   };
  //   try {
  //     return await dio.get(url, queryParameters: query);
  //   } catch (e) {
  //     if (e is DioError) {
  //       if (e.response != null) {
  //         // Handle other errors
  //         print('Dio error response:');
  //         print(e.response?.data);
  //         print(e.response?.statusCode);
  //       } else {
  //         // Handle network-related errors
  //         print('Dio network error:');
  //         print(e.message);
  //       }
  //
  //       if (e.response?.statusCode == 422) {
  //         final error = e.response?.data;
  //         final message = error["message"];
  //         print('Status code 422 error:');
  //         print(error);
  //         print(message);
  //       }
  //     }
  //     // Rethrow the error to handle it in the calling code if needed
  //     throw e;
  //   }
  // }



  static Future<Response> postData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String? token
      }) async {
    dio1.options.headers = {
      'Authorization': "Bearer $token",
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio1.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String? token}) async {
    dio1.options.headers = {
      'Authorization': token,
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio1.put(url, queryParameters: query, data: data);
  }
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio1.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return dio1.delete(url, queryParameters: query);

  }

}