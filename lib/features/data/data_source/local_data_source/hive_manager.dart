import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/app_logger.dart';

/*class HiveManager {
  // Singleton instance
  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  HiveManager._internal();

  // Box instance
  late Box _box;

  /// Initialize Hive box
  Future<void> initialize(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox(boxName);
    } else {
      _box = Hive.box(boxName);
    }
  }

  /// Create or update data
  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  /// Read data
  dynamic get(String key) {
    return _box.get(key);
  }

  /// Delete data
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  /// Clear all data in the box
  Future<void> clear() async {
    await _box.clear();
  }

  /// Store a Map
  Future<void> putMap(String key, Map<String, dynamic> map) async {
    await _box.put(key, map);
  }

  /// Retrieve a Map
  Map<String, dynamic>? getMap(String key) {
    return _box.get(key)?.cast<String, dynamic>();
  }

  /// Check if a key exists
  bool containsKey(String key) {
    return _box.containsKey(key);
  }
}*/

class HiveManager {
  // Singleton instance
  static final HiveManager _instance = HiveManager._internal();

  // Private constructor
  HiveManager._internal();

  // Factory constructor
  factory HiveManager() {
    return _instance;
  }


  // Initialize Hive
  Future<void> initHive() async {
    Logger().info("Initializing Hive...");
    await Hive.initFlutter();
    Logger().info("Hive initialized successfully.");
  }

  // Open a Hive box
  Future<Box> openBox(String boxName) async {
    Logger().info("Opening box: $boxName");
    try {
      final box = await Hive.openBox(boxName);
      Logger().info("Box '$boxName' opened successfully.");
      return box;
    } catch (e) {
      Logger().error("Error opening box '$boxName': $e");
      rethrow;
    }
  }

  // Create or update data
  Future<void> putData(String boxName, String key, dynamic value) async {
    Logger().info("Putting data in box '$boxName' with key '$key'.");
    final box = await openBox(boxName);
    await box.put(key, value);
    Logger().info("Data saved successfully in box '$boxName' with key '$key'.");
  }

  // Read data
  Future<dynamic> getData(String boxName, String key) async {
    Logger().info("Fetching data from box '$boxName' with key '$key'.");
    final box = await openBox(boxName);
    final value = box.get(key);
    Logger().info(value != null
        ? "Data fetched successfully: $value"
        : "No data found for key '$key'.");
    return value;
  }

  // Delete data
  Future<void> deleteData(String boxName, String key) async {
    Logger().info("Deleting data in box '$boxName' with key '$key'.");
    final box = await openBox(boxName);
    await box.delete(key);
    Logger().info("Data deleted successfully from box '$boxName' with key '$key'.");
  }

  // Store map values
  Future<void> putMap(String boxName, Map<String, dynamic> map) async {
    Logger().info("Storing map values in box '$boxName'.");
    final box = await openBox(boxName);
    await box.putAll(map);
    Logger().info("Map values stored successfully in box '$boxName'.");
  }

  // Retrieve entire box contents as a map
  Future<Map<dynamic, dynamic>> getAllData(String boxName) async {
    Logger().info("Fetching all data from box '$boxName'.");
    final box = await openBox(boxName);
    final map = box.toMap();
    Logger().info("Data fetched successfully: $map");
    return map;
  }

  // Close a box
  Future<void> closeBox(String boxName) async {
    Logger().info("Closing box '$boxName'.");
    final box = await Hive.boxExists(boxName)
        ? Hive.box(boxName)
        : throw Exception("Box '$boxName' does not exist.");
    await box.close();
    Logger().info("Box '$boxName' closed successfully.");
  }
}

