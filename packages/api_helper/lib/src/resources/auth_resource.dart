import 'dart:convert';
import 'dart:io';

import 'package:api_helper/api_helper.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class AuthResource {
  /// {@macro example_resource}
  AuthResource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Returns
  Future<AuthModel> signIn({
    required String email,
    required String password,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _apiClient.post(
        'oauth/token',
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
        // modifiedHeaders: headers,
      );

      if (response.statusCode == 201) {
        final data = AuthModel.fromJson((jsonDecode(response.body)));
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<dynamic> signup({
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
      final response = await _apiClient.post(
        'signup',
        body: json.encode(
          {
            "email": email,
            "password": password,
            "username": username,
            "country": country,
            "birthdate": birthdate,
            "given_name": givenName,
            "family_name": familyBame,
            "phoneNumber": "+1234567890",
            "region": region,
          },
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = (jsonDecode(response.body));
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<dynamic> login({
    required String refreshToken,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _apiClient.post(
        'login',
        body: json.encode(
          {
            "refreshToken": refreshToken,
          },
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = (jsonDecode(response.body));
        return data;
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
