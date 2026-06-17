import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HiveStorageService {
  Future<void> init() async {
    await Hive.initFlutter();
    // We will open offline caching boxes in subsequent phases (e.g. bookings, rooms, etc.)
  }
}

final hiveStorageServiceProvider = Provider<HiveStorageService>((ref) {
  return HiveStorageService();
});
