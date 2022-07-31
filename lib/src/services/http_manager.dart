import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'post';
  static const String get = 'get';
  static const String put = 'put';
  static const String delete = 'delete';
  static const String patch = 'patch';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    //headers
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'ekmCuaOtlzJK9x8ilVbyWFTtHUGXiYod8dgNPHtf',
        'X-Parse-REST-API-Key': '4dui5UhCGEBOKu88OYDZwY1abdqspm8ZiuIBegFL'
      });
    Dio dio = Dio();

    try {
      var response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );
      return response.data;
    } on DioError catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }
}
