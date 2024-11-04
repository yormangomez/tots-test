part of 'injection_container.dart';

void _initRepositoriesInjections() {
  sl.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authResource: sl(),
    ),
  );
  sl.registerFactory<ClientRepository>(
    () => ClientRepositoryImpl(
      clientResource: sl(),
    ),
  );
}
