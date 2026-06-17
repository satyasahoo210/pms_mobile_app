import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/core/storage/secure_storage_service.dart';
import 'package:pms_admin/features/auth/data/auth_repository.dart';
import 'package:pms_admin/features/auth/presentation/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class MockAuthRepository extends AuthRepository {
  MockAuthRepository() : super(http.Client());

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    return {
      'access_token': 'fake_token',
      'refresh_token': 'fake_refresh',
      'user': {
        'id': '1',
        'email': email,
        'name': 'Test User',
        'role': 'STAFF',
        'tenantId': 'tenant_1',
      }
    };
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
  testWidgets('Login screen renders input fields and submit button', (WidgetTester tester) async {
    final mockStorage = MockSecureStorageService();
    final mockRepository = MockAuthRepository();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          secureStorageProvider.overrideWithValue(mockStorage),
          authRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      ),
    );

    // Let the asynchronous secure storage check complete
    await tester.pumpAndSettle();

    // Verify inputs and button exist
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('SIGN IN'), findsOneWidget);
  });
}
