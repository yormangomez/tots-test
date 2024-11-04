part of 'injection_container.dart';

void _initNetworkInjections(
    Environments environment, void Function(dynamic, StackTrace?)? onError) {
  sl.registerSingleton<Env>(Env(value: environment));
  sl.registerLazySingleton<ApiClient>(
      () => ApiClient(env: sl(), onError: onError));
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
