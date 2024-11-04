import 'dart:async';

import 'package:api_helper/api_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/injection/injection_container.dart';

part 'app_event.dart';
part 'app_state.dart';

/// {@template app_bloc}
/// The `AppBloc` class is a Dart class that represents the business logic
/// for the main application.
///
/// This class is responsible for handling all of the business logic for the
/// main application. This includes handling the app's state, reacting to
/// events from the UI, and performing any logic to determine what the UI
/// should display.
/// {@endtemplate}
class AppBloc extends Bloc<AppEvent, AppState> {
  /// {@macro app_bloc}

  AppBloc({
    required Env env,
  }) : super(AppState(env: env)) {
    on<SetUserData>(_setUserData);
    on<OnClearSessionEvent>(_onClearSession);
    on<ChangeEnvEvent>(_onChangeEnv);
    on<signInEvent>(_signInEvent);
  }

  FutureOr<void> _setUserData(SetUserData event, Emitter<AppState> emit) {
    emit(
      state.copyWith(
        token: event.token,
        userName: event.userName,
        signIn: false,
      ),
    );
  }

  Future<void> _onClearSession(
      OnClearSessionEvent event, Emitter<AppState> emit) async {
    // await _userRepository.clearUserSession();

    emit(
      AppState(
        env: state.env,
      ),
    );
  }

  void _onChangeEnv(ChangeEnvEvent event, Emitter<AppState> emit) {
    sl<Env>().value = event.env.value;

    emit(
      AppState(
        env: event.env,
      ),
    );
  }

  FutureOr<void> _signInEvent(
          signInEvent event, Emitter<AppState> emit) async =>
      emit(state.copyWith(signIn: event.signIn));
}
