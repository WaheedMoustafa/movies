import 'package:dio/dio.dart';

class DioUtils {
  static Dio init() {
      Dio dio = Dio();
      dio.options.baseUrl = "https://api.themoviedb.org";

      return dio;
    }

}

extension ResponseExtension on Response {
  bool get isSuccessful => statusCode! >= 200 && statusCode! < 300 ;
}