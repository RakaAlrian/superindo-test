import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:superindo/src/utilities/constants.dart';

@module
abstract class ModuleInjector {
  @lazySingleton
  Dio get dio {
    String baseUrl = ConstData.baseUrl;
    int timeOut = 60000;

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        sendTimeout: timeOut,
      ),
    );
  }
}
