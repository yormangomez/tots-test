import 'dart:convert';
import 'dart:io';

import 'package:api_helper/api_helper.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class ClientResource {
  /// {@macro example_resource}
  ClientResource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Returns
  Future<List<ClientModel>> getClient({
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _apiClient.get(
        'clients',
        modifiedHeaders: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = (jsonDecode(response.body)['data'] as List)
            .map((e) => ClientModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<bool> createrClient({
    required String firstName,
    required String lastName,
    required String email,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _apiClient.post(
        'clients',
        body: jsonEncode({
          "firstname": firstName,
          "lastname": lastName,
          "email": email,
          "address": "Buenos Aires, Argentina",
          "photo": "",
          "caption": ""
        }),
        modifiedHeaders: headers,
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<bool> updateClient({
    required String firstName,
    required String lastName,
    required String email,
    required String id,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _apiClient.post(
        'clients/$id',
        body: jsonEncode({
          "firstname": firstName,
          "lastname": lastName,
          "email": email,
          "address": "Buenos Aires, Argentina",
          "photo": "",
          "caption": ""
        }),
        modifiedHeaders: headers,
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
