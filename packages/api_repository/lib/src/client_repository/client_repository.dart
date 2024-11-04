// ignore_for_file: depend_on_referenced_packages

import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class ClientRepository {
  Future<Either<Failure, List<ClientModel>>> getClient({
    Map<String, String>? headers,
  });
  Future<Either<Failure, bool>> createrClient({
    required String firstName,
    required String lastName,
    required String email,
    Map<String, String>? headers,
  });
  Future<Either<Failure, bool>> updateClient({
    required String firstName,
    required String lastName,
    required String email,
    required String id,
    Map<String, String>? headers,
  });
}
