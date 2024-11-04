// ignore_for_file: depend_on_referenced_packages

import 'package:api_helper/api_helper.dart';
import 'package:api_repository/src/auth_repository/auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthResource authResource;
  @override
  AuthRepositoryImpl({
    required this.authResource,
  });

  @override
  Future<Either<Failure, AuthModel>> signIn({
    required String email,
    required String password,
    Map<String, String>? headers,
  }) async {
    try {
      final authModel = await authResource.signIn(
        email: email,
        password: password,
        headers: headers,
      );

      return Right(authModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, dynamic>> login({
    required String refreshToken,
    Map<String, String>? headers,
  }) async {
    try {
      final authModel = await authResource.login(
        refreshToken: refreshToken,
        headers: headers,
      );

      return Right(authModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signup({
    required String email,
    required String password,
    required String username,
    required String country,
    required String birthdate,
    required String givenName,
    required String familyBame,
    required String phoneNumber,
    required String region,
    Map<String, String>? headers,
  }) async {
    try {
      final authModel = await authResource.signup(
        email: email,
        password: password,
        username: username,
        country: country,
        birthdate: birthdate,
        givenName: givenName,
        familyBame: familyBame,
        phoneNumber: phoneNumber,
        region: region,
        headers: headers,
      );

      return Right(authModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
