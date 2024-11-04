part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.authIndex = 0,
    this.index = 0,
    this.isUsarName = 'true',
  });

  final int authIndex;
  final int index;
  final String isUsarName;

  AuthState copyWith({
    int? authIndex,
    int? index,
    String? isUsarName,
  }) {
    return AuthState(
      authIndex: authIndex ?? this.authIndex,
      index: index ?? this.index,
      isUsarName: isUsarName ?? this.isUsarName,
    );
  }

  @override
  List<Object> get props => [
        authIndex,
        index,
        isUsarName,
      ];
}
