part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final String country;
  final String birthdate;
  final String givenName;
  final String familyBame;
  final String phoneNumber;
  final String region;

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.username,
    required this.country,
    required this.birthdate,
    required this.givenName,
    required this.familyBame,
    required this.phoneNumber,
    required this.region,
  });

  @override
  List<Object> get props => [
        email,
        password,
        username,
        country,
        birthdate,
        givenName,
        familyBame,
        phoneNumber,
        region,
      ];
}

class AuthIndexEvent extends AuthEvent {
  final int authIndex;
  const AuthIndexEvent({required this.authIndex});
  @override
  List<Object> get props => [authIndex];
}

class IndexEvent extends AuthEvent {
  final int index;
  const IndexEvent({required this.index});
  @override
  List<Object> get props => [index];
}

class UserNameEvent extends AuthEvent {
  final String userName;
  const UserNameEvent({required this.userName});
  @override
  List<Object> get props => [userName];
}

class LogOutEvent extends AuthEvent {}
