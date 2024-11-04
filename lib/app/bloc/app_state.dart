// ignore_for_file: public_member_api_docs

part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.token,
    this.env,
    this.userName,
    this.signIn = false,
  });

  final String? token;
  final String? userName;

  final Env? env;
  final bool signIn;

  @override
  List<Object?> get props => [
        token,
        userName,
        env,
        signIn,
      ];

  AppState copyWith({
    String? token,
    String? userName,
    Env? env,
    bool? signIn,
    bool? mustShowQualtrics,
  }) {
    return AppState(
      token: token ?? this.token,
      userName: userName ?? this.userName,
      env: env ?? this.env,
      signIn: signIn ?? this.signIn,
    );
  }

  Map<String, String> createHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
