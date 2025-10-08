import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';
import '../services/auth_service.dart';
import '../services/rates_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Secure Storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    ),
  );

  // Dio Client
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(getIt<FlutterSecureStorage>()),
  );

  // Auth Service
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(
      getIt<DioClient>(),
      getIt<FlutterSecureStorage>(),
    ),
  );

  // Rates Service
  getIt.registerLazySingleton<RatesService>(
    () => RatesService(getIt<DioClient>()),
  );
}
