import 'package:flutter/foundation.dart';
import 'package:mula_biz_mobile/common/local_data/shared_pref.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/common/utils/alice_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../common/config/index.dart';
import '../../../common/logger/index.dart';
import '../../../di/di_setup.dart';
import 'dio_interceptor.dart';

class DioBuilder {
  Dio? dio;

  Dio getDio() {
    if (dio == null) {
      final BaseOptions options = BaseOptions(
        baseUrl: getUrl(),
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: ApiConfig.connectTimeout),
        receiveTimeout: const Duration(seconds: ApiConfig.receiveTimeout),
        headers: {
          "accept": "application/json",
          'content-Type': "Application/json",
        },
      );
      dio = Dio(options);
      dio?.interceptors.addAll(
        [
          if (kDebugMode)
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseHeader: true,
            ),
          DioInterceptor(),
          getIt<AliceHelper>().alice.getDioInterceptor(),
          InterceptorsWrapper(
            onRequest: (
              RequestOptions options,
              RequestInterceptorHandler requestInterceptorHandler,
            ) async {
              String? token =
                  await LocalStorageImpl().get(SPKeys.accessToken.name);

              if (token != null) {
                options.headers
                    .putIfAbsent('Authorization', () => 'Bearer $token');
              }
              return requestInterceptorHandler.next(options);
            },
          ),
        ],
      );
    }
    return dio!;
  }

  String getUrl() {
    return dotenv.get('BASE_URL');
  }
}
