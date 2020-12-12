import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:myclig/core/device_info/app_version.dart';
import 'package:myclig/core/device_info/device_information.dart';
import 'package:myclig/core/network/http_requester.dart';
import 'package:myclig/core/network/network_info.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/dio_connectivity_request_retrier.dart';
import '../interceptors/retry_request_interceptor.dart';
import '../local_data/user_data/get_loggedin_user_data.dart';
import '../local_data/user_data/save_loggedin_user_data.dart';
import '../local_data/user_token/get_user_logged_in_token.dart';
import '../local_data/user_token/set_user_logged_in_token.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  final sharePreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<GetLoggedInUserToken>(
    () => GetLoggedInUserTokenImpl(
      sharePreferences,
    ),
  );

  

  sl.registerLazySingleton(
    () => DeviceInformation(
      deviceInfoPlugin: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => DeviceInfoPlugin(),
  );

  sl.registerLazySingleton(
    () => Connectivity(),
  );

  sl.registerLazySingleton(
    () => Dio(),
  );

  sl.registerLazySingleton(
    () => DioConnectivityRequestRetrier(
      connectivity: sl(),
      dio: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => RetryOnConnectionChangeInterceptor(
      requestRetrier: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => HttpServiceRequester(
      dio: sl(),
      dioCacheManager: sl(),
      retryOnConnectionChangeInterceptor: sl(),
    ),
  );

  sl.registerLazySingleton(() => DioCacheManager(
        CacheConfig(),
      ));

  sl.registerLazySingleton<SaveLoggedInUserToken>(
    () => SaveLoggedInUserTokenImpl(
      sharePreferences,
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => DataConnectionChecker());

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  sl.registerLazySingleton(
    () => AppVersion(
      packageInfo: packageInfo,
    ),
  );

  sl.registerLazySingleton<SaveLoggedInUserData>(
    () => SaveLoggedInUserDataImpl(
      sharePreferences,
    ),
  );

  sl.registerSingleton<GetLoggedInUserData>(
    GetLoggedInUserDataImpl(
      sharePreferences,
    ),
  );
  

  sl.registerLazySingleton(
    () => DotEnv(),
  );
}
