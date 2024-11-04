part of 'injection_container.dart';

void _initBlocsInjections() {
  sl.registerFactory(() => AppBloc(env: sl()));
  sl.registerFactory(() => AuthBloc(
        authRepository: sl(),
      ));
  sl.registerFactory(
    () => ClientBloc(
      clientRepository: sl(),
    ),
  );
}
