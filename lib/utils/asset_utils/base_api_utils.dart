import 'dart:convert';

import 'package:dio/dio.dart' as dio;


class BaseApiUtils {

  static Future<void> multipartFormDataApiResponse({
    required String apiString,
    required String authorization,
    required dio.FormData formData,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    if(authorization == "") {
      try{
        final response = await dio.Dio().post(
          apiString,
          data: formData,
          options: dio.Options(
            headers: <String, String>{
              'Content-Type': 'multipart/form-data',
            },
          ),
        );

        if(response.statusCode == 200 || response.statusCode == 201 ) {
          onSuccess(response.data["message"],response.data);
        } else {
          onFail(response.data["message"],response.data);
        }
      } on dio.DioException catch (e) {
        onExceptionFail(e.response?.data["message"],e.response?.data);
      }
    } else {
      try{
        final response = await dio.Dio().post(
          apiString,
          data: formData,
          options: dio.Options(
            headers: <String, String>{
              'Content-Type': 'multipart/form-data',
              'Authorization': authorization
            },
          ),
        );

        if(response.statusCode == 200 || response.statusCode == 201 ) {
          onSuccess(response.data["message"],response.data);
        } else {
          onFail(response.data["message"],response.data);
        }
      } on dio.DioException catch (e) {
        onExceptionFail(e.response?.data["message"],e.response?.data);
      }
    }
  }


  static Future<void> postApiResponse({
    required String apiString,
    required String authorization,
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail,
  }) async {
    if(authorization == "") {
      try{
        final response = await dio.Dio().post(
          apiString,
          data: jsonEncode(data),
          options: dio.Options(
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

        if(response.statusCode == 200 || response.statusCode == 201 ) {
          onSuccess(response.data["message"],response.data);
        } else {
          onFail(response.data["message"],response.data);
        }
      } on dio.DioException catch (e) {
        onExceptionFail(e.response?.data["message"],e.response?.data);
      }
    } else {
      try{
        final response = await dio.Dio().post(
          apiString,
          data: jsonEncode(data),
          options: dio.Options(
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': authorization
            },
          ),
        );

        if(response.statusCode == 200 || response.statusCode == 201 ) {
          onSuccess(response.data["message"],response.data);
        } else {
          onFail(response.data["message"],response.data);
        }
      } on dio.DioException catch (e) {
        onExceptionFail(e.response?.data["message"],e.response?.data);
      }
    }
  }




}