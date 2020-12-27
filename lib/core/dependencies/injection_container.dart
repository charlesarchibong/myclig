import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:myclig/core/device_info/app_version.dart';
import 'package:myclig/core/device_info/device_information.dart';
import 'package:myclig/core/network/http_requester.dart';
import 'package:myclig/core/network/network_info.dart';
import 'package:myclig/core/notification/get_fcm_user_token.dart';
import 'package:myclig/core/upload/upload_to_firebase_storage.dart';
import 'package:myclig/features/user/data/datasources/user_remote_data_source.dart';
import 'package:myclig/features/user/data/repositories/user_repository_impl.dart';
import 'package:myclig/features/user/domain/repositories/user_repository.dart';
import 'package:myclig/features/user/domain/usecases/get_user_usecase.dart';
import 'package:myclig/features/user/domain/usecases/login_user_usecase.dart';
import 'package:myclig/features/user/domain/usecases/register_or_update_user_usecase.dart';
import 'package:myclig/features/user/domain/usecases/reset_password_usecase.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/login/login_state.dart';
import 'package:myclig/features/user/presentation/bloc/reset_password/reset_password_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/reset_password/reset_password_state.dart';
import 'package:myclig/features/user/presentation/bloc/user/create_account_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:myclig/features/user/presentation/bloc/user/verify_created_account_bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/dio_connectivity_request_retrier.dart';
import '../interceptors/retry_request_interceptor.dart';
import '../local_data/user_data/get_loggedin_user_data.dart';
import '../local_data/user_data/save_loggedin_user_data.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  final sharePreferences = await SharedPreferences.getInstance();
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase();
  databaseReference.setPersistenceEnabled(true);
  databaseReference.setPersistenceCacheSizeBytes(10000000);

  // databaseReference.a

  sl.registerLazySingleton<AppNotification>(
    () => AppNotificationImpl(
      firebaseMessaging: sl(),
    ),
  );

  sl.registerLazySingleton(() => FirebaseMessaging());

  sl.registerLazySingleton(
    () => DeviceInformation(
      deviceInfoPlugin: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => UserBloc(
      getUser: sl(),
      registerOrUpdateUser: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoginBloc(
      initialState: InitialLoginState(),
      loginUser: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => CreateAccountBloc(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ResetPasswordBloc(
      initialState: InitialResetPasswordMailState(),
      resetPassword: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => VerifyCreatedAccountBloc(
      sl(),
    ),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      networkInfo: sl(),
      userRemoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      appNotification: sl(),
      databaseReference: databaseReference.reference(),
      firebaseAuth: firebaseAuth,
      uploadToFirebase: sl(),
      saveLoggedInUserData: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetUser(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ResetPassword(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => LoginUser(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => RegisterOrUpdateUser(
      sl(),
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

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton<UploadToFirebase>(
    () => UploadToFirebaseImpl(
      firebaseStorage: firebaseStorage,
    ),
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
