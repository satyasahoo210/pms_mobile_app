import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/storage/secure_storage_service.dart';
import 'package:pms_admin/core/storage/storage_keys.dart';
import 'package:pms_admin/core/utils/logger.dart';
import 'package:pms_admin/features/auth/data/auth_repository.dart';
import 'package:pms_admin/features/auth/domain/auth_models.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  final SecureStorageService _storage;

  AuthController(this._repository, this._storage) : super(AuthState.initial()) {
    initializeSession();
  }

  Future<void> initializeSession() async {
    appLog('[AuthController] initializeSession started.');
    state = AuthState.authenticating();
    try {
      final refreshToken = await _storage.read(StorageKeys.refreshToken);
      if (refreshToken != null) {
        appLog(
          '[AuthController] initializeSession: attempting refresh using refreshToken.',
        );
        final success = await refreshSession(refreshToken);
        if (success) {
          appLog('[AuthController] initializeSession: refresh succeeded.');
          return;
        }
      }
      appLog('[AuthController] initializeSession: unauthenticated.');
      await logout();
    } catch (e) {
      appLog('[AuthController] initializeSession failed: $e');
      await logout();
    }
  }

  Future<bool> refreshSession(String refreshToken) async {
    appLog('[AuthController] refreshSession started.');
    try {
      final data = await _repository.refresh(refreshToken);
      final newAccessToken = data['access_token'] as String;
      final newRefreshToken = data['refresh_token'] as String;
      final user = User.fromJson(data['user'] as Map<String, dynamic>);

      await _storage.write(StorageKeys.accessToken, newAccessToken);
      await _storage.write(StorageKeys.refreshToken, newRefreshToken);
      await _storage.write(StorageKeys.userProfile, jsonEncode(user.toJson()));
      await _storage.write(StorageKeys.tenantId, user.tenantId);

      appLog(
        '[AuthController] refreshSession succeeded for user: ${user.email}',
      );
      state = AuthState.authenticated(user);
      return true;
    } catch (e) {
      appLog('[AuthController] refreshSession failed: $e');
      logout();
      return false;
    }
  }

  Future<void> login(String email, String password) async {
    appLog('[AuthController] login started for: $email');
    state = AuthState.authenticating();
    try {
      final data = await _repository.login(email, password);
      final accessToken = data['access_token'] as String;
      final refreshToken = data['refresh_token'] as String;
      final user = User.fromJson(data['user'] as Map<String, dynamic>);

      await _storage.write(StorageKeys.accessToken, accessToken);
      await _storage.write(StorageKeys.refreshToken, refreshToken);
      await _storage.write(StorageKeys.userProfile, jsonEncode(user.toJson()));
      await _storage.write(StorageKeys.tenantId, user.tenantId);

      appLog('[AuthController] login succeeded for: ${user.email}');
      state = AuthState.authenticated(user);
    } catch (e) {
      appLog('[AuthController] login failed: $e');
      state = AuthState.error(e.toString().replaceAll('Exception:', '').trim());
    }
  }

  Future<void> logout() async {
    appLog('[AuthController] logout started.');
    state = AuthState.authenticating();
    try {
      await _storage.delete(StorageKeys.accessToken);
      await _storage.delete(StorageKeys.refreshToken);
      await _storage.delete(StorageKeys.userProfile);
      await _storage.delete(StorageKeys.tenantId);
      appLog('[AuthController] logout storage cleared.');
    } catch (e) {
      appLog('[AuthController] logout storage clear failed: $e');
    }
    state = AuthState.unauthenticated();
  }

  Future<void> toggleBiometrics(bool enabled) async {
    await _storage.write(StorageKeys.biometricsEnabled, enabled.toString());
  }

  Future<bool> isBiometricsEnabled() async {
    final val = await _storage.read(StorageKeys.biometricsEnabled);
    return val == 'true';
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final repository = ref.watch(authRepositoryProvider);
    final storage = ref.watch(secureStorageProvider);
    return AuthController(repository, storage);
  },
);
