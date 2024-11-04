part of 'injection_container.dart';

void _initResourcesInjections() {
  sl.registerFactory<AuthResource>(() => AuthResource(
        apiClient: sl(),
      ));
  sl.registerFactory<ClientResource>(() => ClientResource(
        apiClient: sl(),
      ));
}
