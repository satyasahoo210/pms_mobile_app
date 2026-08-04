import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pms_admin/core/network/api_config.dart';
import 'package:pms_admin/core/storage/secure_storage_service.dart';
import 'package:pms_admin/core/storage/storage_keys.dart';
import 'package:pms_admin/core/utils/logger.dart';

final graphqlClientProvider = Provider<GraphQLClient>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final link = createGraphqlLink(secureStorage);

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore()),
  );
});

Link createGraphqlLink(SecureStorageService secureStorage) {
  final httpLink = HttpLink(ApiConfig.graphqlUrl);

  final authLink = AuthLink(
    getToken: () async {
      final token = await secureStorage.read(StorageKeys.accessToken);
      return token == null ? null : 'Bearer $token';
    },
  );

  final errorLink = ErrorLink(
    onGraphQLError: (Request request, NextLink forward, Response response) async* {
      appLog(
        '[GraphQLClient] GraphQLError received on request: ${request.operation.operationName}. Errors: ${response.errors}',
      );
      final isUnauthorized =
          response.errors?.any(
            (error) =>
                error.message.contains('Unauthorized') ||
                error.message.contains('JWT') ||
                error.extensions?['code'] == 'UNAUTHENTICATED',
          ) ??
          false;

      if (isUnauthorized) {
        appLog(
          '[GraphQLClient] Unauthorized error detected. Attempting token refresh.',
        );
        final success = await attemptTokenRefresh(secureStorage);
        if (success) {
          appLog(
            '[GraphQLClient] Token refresh succeeded. Retrying original request.',
          );
          yield* forward(request);
          return;
        }
        appLog(
          '[GraphQLClient] Token refresh failed. Proceeding with error response.',
        );
      }
      yield response;
    },
    onException: (Request request, NextLink forward, LinkException exception) async* {
      appLog(
        '[GraphQLClient] LinkException received on request: ${request.operation.operationName}. Exception: $exception',
      );
      if (exception is HttpLinkServerException && exception.statusCode == 401) {
        appLog(
          '[GraphQLClient] status code 401 detected. Attempting token refresh.',
        );
        final success = await attemptTokenRefresh(secureStorage);
        if (success) {
          appLog(
            '[GraphQLClient] Token refresh succeeded. Retrying original request.',
          );
          yield* forward(request);
          return;
        }
        appLog('[GraphQLClient] Token refresh failed.');
      }
      yield* forward(request);
    },
  );

  return Link.from([authLink, errorLink, httpLink]);
}

Future<bool> attemptTokenRefresh(SecureStorageService secureStorage) async {
  appLog('[GraphQLClient] attemptTokenRefresh started.');
  final refreshToken = await secureStorage.read(StorageKeys.refreshToken);
  if (refreshToken == null) {
    appLog(
      '[GraphQLClient] attemptTokenRefresh failed: no refresh token found in storage.',
    );
    return false;
  }

  try {
    final response = await http.post(
      Uri.parse('${ApiConfig.authUrl}/refresh'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refresh_token': refreshToken}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data['access_token'];
      final newRefreshToken = data['refresh_token'];

      if (newAccessToken != null) {
        await secureStorage.write(StorageKeys.accessToken, newAccessToken);
        if (newRefreshToken != null) {
          await secureStorage.write(StorageKeys.refreshToken, newRefreshToken);
        }
        appLog('[GraphQLClient] attemptTokenRefresh succeeded.');
        return true;
      }
    }
    appLog(
      '[GraphQLClient] attemptTokenRefresh failed. Status code: ${response.statusCode}',
    );
  } catch (e) {
    appLog('[GraphQLClient] attemptTokenRefresh failed with exception: $e');
  }
  return false;
}
