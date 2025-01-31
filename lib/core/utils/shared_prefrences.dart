import 'package:get_storage/get_storage.dart';

class StorageService {
  // Singleton Instance
  static final StorageService _instance = StorageService._internal();

  // Internal Constructor
  StorageService._internal();

  // Factory Constructor
  factory StorageService() => _instance;

  // GetStorage Instance
  final _storage = GetStorage();

  // Initialize GetStorage
  static Future<void> init() async {
    await GetStorage.init();
  }

  // Store Integer
  Future<void> saveInt(String key, int value) async {
    await _storage.write(key, value);
  }

  int? getInt(String key) {
    return _storage.read<int>(key);
  }

  // Store String
  Future<void> saveString(String key, String value) async {
    await _storage.write(key, value);
  }

  String? getString(String key) {
    return _storage.read<String>(key);
  }

  // Store Boolean
  Future<void> saveBool(String key, bool value) async {
    await _storage.write(key, value);
  }

  bool? getBool(String key) {
    return _storage.read<bool>(key);
  }

  // Store Double
  Future<void> saveDouble(String key, double value) async {
    await _storage.write(key, value);
  }

  double? getDouble(String key) {
    return _storage.read<double>(key);
  }

  // Store Float (using double since Dart doesn't have a float type)
  Future<void> saveFloat(String key, double value) async {
    await _storage.write(key, value);
  }

  double? getFloat(String key) {
    return _storage.read<double>(key);
  }

  // Store DateTime
  Future<void> saveDateTime(String key, DateTime value) async {
    await _storage.write(key, value.toIso8601String());
  }

  DateTime? getDateTime(String key) {
    final value = _storage.read<String>(key);
    return value != null ? DateTime.parse(value) : null;
  }

  // Store List
  Future<void> saveList(String key, List<dynamic> value) async {
    await _storage.write(key, value);
  }

  List<dynamic>? getList(String key) {
    return _storage.read<List<dynamic>>(key);
  }

  // Remove Data
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  // Clear All Data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}


/**
 * Use Of Shared Pref
void main() async {
  // Initialize GetStorage
  await StorageService.init();

  final storage = StorageService();

  // Example Usage
  await storage.saveInt('key_int', 42);
  print('Saved Int: ${storage.getInt('key_int')}');

  await storage.saveString('key_string', 'Hello, World!');
  print('Saved String: ${storage.getString('key_string')}');

  await storage.saveBool('key_bool', true);
  print('Saved Bool: ${storage.getBool('key_bool')}');

  await storage.saveDouble('key_double', 42.42);
  print('Saved Double: ${storage.getDouble('key_double')}');

  await storage.saveDateTime('key_datetime', DateTime.now());
  print('Saved DateTime: ${storage.getDateTime('key_datetime')}');

  await storage.saveList('key_list', [1, 2, 3, 4, 5]);
  print('Saved List: ${storage.getList('key_list')}');
}*/
