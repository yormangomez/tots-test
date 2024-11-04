// ignore_for_file: depend_on_referenced_packages

import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class ClientRepositoryImpl extends ClientRepository {
  ClientResource clientResource;
  @override
  ClientRepositoryImpl({
    required this.clientResource,
  });

  @override
  Future<Either<Failure, List<ClientModel>>> getClient({
    Map<String, String>? headers,
  }) async {
    try {
      final getModel = await clientResource.getClient(
        headers: headers,
      );

      return Right(getModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, bool>> createrClient({
    required String firstName,
    required String lastName,
    required String email,
    Map<String, String>? headers,
  }) async {
    try {
      final createrModel = await clientResource.createrClient(
        firstName: firstName,
        lastName: lastName,
        email: email,
        headers: headers,
      );

      return Right(createrModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, bool>> updateClient({
    required String firstName,
    required String lastName,
    required String email,
    required String id,
    Map<String, String>? headers,
  }) async {
    try {
      final updateModel = await clientResource.updateClient(
        firstName: firstName,
        lastName: lastName,
        email: email,
        id: id,
        headers: headers,
      );

      return Right(updateModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
