// ignore_for_file: depend_on_referenced_packages

import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> signIn({
    required String email,
    required String password,
    Map<String, String>? headers,
  });

  Future<Either<Failure, dynamic>> login({
    required String refreshToken,
    Map<String, String>? headers,
  });

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
  });
}
