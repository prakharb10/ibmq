import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

final logger = Logger();

/// Data provider class to interact with the Hive database
class HiveDataProvider {
  /// Initialize the Hive database
  static Future<void> init() => Hive.initFlutter();

  /// Open required boxes
  static Future<void> openBoxes() async {
    // TODO: Add encryption
    await Hive.openBox('ibmq');
  }

  /// Close the Hive database
  static Future<void> close() async => await Hive.close();

  /// Get the box with the given name
  ///
  /// Throws an exception if the box does not exist
  Box getBox(String name) {
    if (Hive.isBoxOpen(name)) {
      return Hive.box(name);
    } else {
      logger.w('Box $name does not exist');
      throw Exception('Box $name does not exist');
    }
  }

  /// Get the value of the given key from the given box
  /// Returns null if the key does not exist
  ///
  /// Throws an exception if an error occurs
  Future<T?> getValue<T>(Box box, String key) async {
    if (box.containsKey(key)) {
      return box.get(key) as T?;
    } else {
      logger.i('Key $key does not exist in box ${box.name}');
      return null;
    }
  }

  /// Put the value of the given key in the given box
  /// If the key does not exist, it is created
  ///
  /// Throws an exception if an error occurs
  Future<void> putValue<T>(Box box, String key, T value) async {
    try {
      await box.put(key, value);
    } catch (e) {
      logger.e('Failed to set value for key $key in box ${box.name}');
      throw Exception('Failed to set value for key $key in box ${box.name}');
    }
  }

  /// Put a map of key-value pairs into the given box
  /// If a key already exists, it is overwritten
  /// If a key does not exist, it is created
  ///
  /// Throws an exception if an error occurs
  Future<void> putAll(Box box, Map<String, dynamic> map) async {
    try {
      await box.putAll(map);
    } catch (e) {
      logger.e('Failed to put all values in box ${box.name}');
      throw Exception('Failed to put all values in box ${box.name}');
    }
  }

  /// Delete the value of the given key from the given box
  /// If the key does not exist, nothing happens
  ///
  /// Throws an exception if an error occurs
  Future<void> deleteValue(Box box, String key) async {
    try {
      await box.delete(key);
    } catch (e) {
      logger.e('Failed to delete value for key $key in box ${box.name}');
      throw Exception('Failed to delete value for key $key in box ${box.name}');
    }
  }
}
