import 'package:flutter_test/flutter_test.dart';
import 'package:pms_admin/features/auth/data/auth_repository.dart';
import 'package:pms_admin/features/auth/domain/auth_models.dart';
import 'package:pms_admin/features/auth/presentation/auth_controller.dart';
import 'package:pms_admin/core/storage/secure_storage_service.dart';
import 'package:pms_admin/core/storage/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class MockAuthRepository extends AuthRepository {
  bool shouldSucceed = true;

  MockAuthRepository() : super(http.Client());

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    if (shouldSucceed) {
      return {
        'access_token': 'fake_access_token',
        'refresh_token': 'fake_refresh_token',
        'user': {
          'id': 'user_id',
          'email': email,
          'name': 'Test User',
          'role': 'STAFF',
          'tenantId': 'tenant_id',
        }
      };
    } else {
      throw Exception('Invalid credentials');
    }
  }

  @override
  Future<Map<String, dynamic>> refresh(String refreshToken) async {
    if (shouldSucceed) {
      return {
        'access_token': 'new_access_token',
        'refresh_token': 'new_refresh_token',
        'user': {
          'id': 'user_id',
          'email': 'test@travelspuri13.com',
          'name': 'Test User',
          'role': 'STAFF',
          'tenantId': 'tenant_id',
        }
      };
    } else {
      throw Exception('Session expired');
    }
  }
}

class MockSecureStorageService extends SecureStorageService {
  final Map<String, String> _storage = {};

  MockSecureStorageService() : super(const FlutterSecureStorage());

  @override
  Future<void> write(String key, String value) async {
    _storage[key] = value;
  }

  @override
  Future<String?> read(String key) async {
    return _storage[key];
  }

  @override
  Future<void> delete(String key) async {
    _storage.remove(key);
  }

  @override
  Future<void> clearAll() async {
    _storage.clear();
  }
}

void main() {
  late MockAuthRepository mockRepository;
  late MockSecureStorageService mockStorage;
  late AuthController controller;

  setUp(() {
    mockRepository = MockAuthRepository();
    mockStorage = MockSecureStorageService();
    controller = AuthController(mockRepository, mockStorage);
  });

  test('Initial state is authenticating on startup', () {
    expect(controller.state.status, AuthStatus.authenticating);
  });

  test('Login updates state to authenticated on success', () async {
    await controller.login('test@travelspuri13.com', 'password');
    expect(controller.state.status, AuthStatus.authenticated);
    expect(controller.state.user?.email, 'test@travelspuri13.com');
  });

  test('Login updates state to error on failure', () async {
    mockRepository.shouldSucceed = false;
    await controller.login('test@travelspuri13.com', 'wrong_password');
    expect(controller.state.status, AuthStatus.error);
    expect(controller.state.errorMessage, 'Invalid credentials');
  });

  test('Logout updates state to unauthenticated', () async {
    await controller.logout();
    expect(controller.state.status, AuthStatus.unauthenticated);
  });

  test('initializeSession refreshes token and authenticates when refresh token exists', () async {
    // Setup storage with old tokens/profile
    await mockStorage.write(StorageKeys.accessToken, 'old_access_token');
    await mockStorage.write(StorageKeys.refreshToken, 'old_refresh_token');
    await mockStorage.write(
      StorageKeys.userProfile,
      '{"id":"user_id","email":"test@travelspuri13.com","name":"Test User","role":"STAFF","tenantId":"tenant_id"}',
    );

    // Call initializeSession
    await controller.initializeSession();

    // Verify session was refreshed and state is authenticated
    expect(controller.state.status, AuthStatus.authenticated);
    expect(controller.state.user?.email, 'test@travelspuri13.com');
    expect(await mockStorage.read(StorageKeys.accessToken), 'new_access_token');
    expect(await mockStorage.read(StorageKeys.refreshToken), 'new_refresh_token');
  });

  test('initializeSession logs out and goes to unauthenticated when refresh token fails', () async {
    // Setup storage with refresh token, but mock repository to fail
    await mockStorage.write(StorageKeys.accessToken, 'old_access_token');
    await mockStorage.write(StorageKeys.refreshToken, 'old_refresh_token');
    mockRepository.shouldSucceed = false;

    // Call initializeSession
    await controller.initializeSession();

    // Verify user was logged out and tokens cleared
    expect(controller.state.status, AuthStatus.unauthenticated);
    expect(await mockStorage.read(StorageKeys.accessToken), isNull);
    expect(await mockStorage.read(StorageKeys.refreshToken), isNull);
  });
}
