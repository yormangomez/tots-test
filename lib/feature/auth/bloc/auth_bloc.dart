import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tots/app/bloc/app_bloc.dart';
import 'package:tots/app/routes/router_config.dart';
import 'package:tots/app/routes/routes_names.dart';
import 'package:tots/core/database/login_store.dart';
import 'package:tots/core/database/user_store.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState()) {
    on<AuthEvent>((event, emit) {});

    on<AuthIndexEvent>(
      (event, emit) => emit(
        state.copyWith(
          authIndex: event.authIndex,
        ),
      ),
    );
    on<IndexEvent>(
      (event, emit) => emit(
        state.copyWith(
          index: event.index,
        ),
      ),
    );
    on<SignUpEvent>(_signUpEvent);
    on<LogOutEvent>((event, emit) async {});

    on<UserNameEvent>((event, emit) async {});
  }
  final AuthRepository _authRepository;

  ///Login method
  Future<void> login(
    BuildContext contextLogin, {
    required String email,
    required String password,
    required Future<void> Function(AppState) onSuccess,
  }) async {
    final auth = await _authRepository.signIn(
      email: email,
      password: password,
    );

    auth.fold((l) async {
      rootNavigatorKey.currentContext!
          .read<AppBloc>()
          .add(const signInEvent(signIn: false));
    }, (r) async {
      // ignore: use_build_context_synchronously

      await LoginStore.instance.logInSession(
        currentStore: 0,
        accessToken: r.accessToken.toString(),
        refreshToken: '',
      );
      await UserStore.instance.logInSession(
        uid: r.id.toString(),
        userName: '',
        firstName: '',
        lastName: '',
        email: r.email.toString(),
        country: '',
        mobile: '',
        avatar: '',
        collaborator: '',
        city: '',
        accessStore: '',
        createdAt: '',
        updatedAt: '',
      );
      final appState = AppState(
        token: r.accessToken,
      );

      await onSuccess(appState);
      rootNavigatorKey.currentContext!
          .read<AppBloc>()
          .add(const signInEvent(signIn: false));
      rootNavigatorKey.currentContext?.go(RoutesNames.home);
    });
  }

  Future<void> _signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    final auth = await _authRepository.signup(
      email: event.email,
      password: event.password,
      username: event.username,
      country: event.country,
      birthdate: event.birthdate,
      givenName: event.givenName,
      familyBame: event.familyBame,
      phoneNumber: event.phoneNumber,
      region: event.region,
    );
    auth.fold(
      (l) {
        rootNavigatorKey.currentContext!
            .read<AppBloc>()
            .add(const signInEvent(signIn: false));
      },
      (r) {
        rootNavigatorKey.currentContext!
            .read<AppBloc>()
            .add(const signInEvent(signIn: false));
        emit(
          state.copyWith(
            authIndex: state.authIndex == 2 ? 1 : 0,
          ),
        );
      },
    );
  }
}
