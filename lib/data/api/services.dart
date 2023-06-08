import 'package:flutter_glori_new/data/constant/constant_api.dart';
import 'package:flutter_glori_new/data/local/share_pref.dart';
import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio()
    ..interceptors.add(LogInterceptor())
    ..options.receiveDataWhenStatusError = true
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.sendTimeout = const Duration(seconds: 10);
  final sharePref = SharePref();

  Future<Response> postLogin({
    required String username,
    required String password,
  }) async {
    try {
      Response res = await _dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        ConstantApi.baseUrl + ConstantApi.loginEndpoint,
        data: {
          'username': username,
          'password': password,
        },
      );
      return res;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> postRegister({
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Response res = await _dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        ConstantApi.baseUrl + ConstantApi.registerEndpoint,
        data: {
          'username': username,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );
      return res;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> getBooks() async {
    try {
      Response res = await _dio.get(
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        ConstantApi.baseUrl + ConstantApi.booksEndpoint,
      );
      return res;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> postBook(
      {required String title,
      required String author,
      required filePath}) async {
    try {
      FormData formData = FormData.fromMap({
        "title": title,
        "author": author,
        "image": await MultipartFile.fromFile(filePath, filename: "glori")
      });
      Response res = await _dio.post(
        ConstantApi.baseUrl + ConstantApi.booksAddEndpoint,
        data: formData,
      );
      return res;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> postReview({
    required int id,
    required String name,
    required String rate,
    required String review,
  }) async {
    try {
      Response res = await _dio.post(
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        "${ConstantApi.baseUrl}/books/$id/review",
        data: {
          'user': name,
          'content': review,
          'rate': rate,
        },
      );
      return res;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
