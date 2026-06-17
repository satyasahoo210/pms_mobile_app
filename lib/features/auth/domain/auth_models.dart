// ignore_for_file: constant_identifier_names

enum UserRole { SUPER_ADMIN, TENANT_ADMIN, PROPERTY_MANAGER, STAFF }

class User {
  final String id;
  final String email;
  final String? name;
  final UserRole role;
  final String tenantId;

  User({
    required this.id,
    required this.email,
    this.name,
    required this.role,
    required this.tenantId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      role: _parseRole(json['role'] as String),
      tenantId: json['tenantId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role.name,
      'tenantId': tenantId,
    };
  }

  static UserRole _parseRole(String roleStr) {
    switch (roleStr.toUpperCase()) {
      case 'SUPER_ADMIN':
        return UserRole.SUPER_ADMIN;
      case 'TENANT_ADMIN':
        return UserRole.TENANT_ADMIN;
      case 'PROPERTY_MANAGER':
        return UserRole.PROPERTY_MANAGER;
      case 'STAFF':
      default:
        return UserRole.STAFF;
    }
  }
}

enum AuthStatus {
  initial,
  authenticating,
  authenticated,
  unauthenticated,
  error,
}

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  const AuthState({required this.status, this.user, this.errorMessage});

  factory AuthState.initial() => const AuthState(status: AuthStatus.initial);
  factory AuthState.authenticating() =>
      const AuthState(status: AuthStatus.authenticating);
  factory AuthState.authenticated(User user) =>
      AuthState(status: AuthStatus.authenticated, user: user);
  factory AuthState.unauthenticated() =>
      const AuthState(status: AuthStatus.unauthenticated);
  factory AuthState.error(String message) =>
      AuthState(status: AuthStatus.error, errorMessage: message);

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isAuthenticating => status == AuthStatus.authenticating;
}
