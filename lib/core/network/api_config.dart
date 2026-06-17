import 'dart:io';
import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String devUrlIos = 'http://192.168.1.15:9000';
  static const String devUrlAndroid = 'http://192.168.1.15:9000';
  static const String prodUrl = 'https://api.travelspuri13.com';

  // Toggle production environment using flutter run --dart-define=IS_PRODUCTION=true
  static const bool isProduction = bool.fromEnvironment(
    'IS_PRODUCTION',
    defaultValue: false,
  );

  static String get baseUrl {
    if (isProduction) return prodUrl;
    if (!kIsWeb && Platform.isAndroid) return devUrlAndroid;
    return devUrlIos;
  }

  static String get graphqlUrl => '$baseUrl/graphql';
  static String get authUrl => '$baseUrl/auth';
}
