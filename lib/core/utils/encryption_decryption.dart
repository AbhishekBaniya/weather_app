/*
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SecureStorageService {
  // Private static instance
  static final SecureStorageService _instance = SecureStorageService._internal();

  // Secure storage instance
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Encryption setup
  final encrypt.Key _key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
  final encrypt.IV _iv = encrypt.IV.fromLength(16); // Randomly generated IV (16 bytes)
  final encrypt.Encrypter _encrypter;

  // Private constructor
  SecureStorageService._internal() : _encrypter = encrypt.Encrypter(encrypt.AES(_key,));

  // Factory method to return the same instance
  factory SecureStorageService() {
    return _instance;
  }

  // Encrypt and store data
  Future<void> encryptAndStoreApiResponse(String apiResponse) async {
    final encryptedData = _encrypter.encrypt(apiResponse, iv: _iv);

    await _secureStorage.write(key: 'encrypted_data', value: encryptedData.base64);
    await _secureStorage.write(key: 'encryption_iv', value: _iv.base64);

    print('Data encrypted and stored securely!');
  }

  // Retrieve and decrypt data
  Future<String?> retrieveAndDecryptApiResponse() async {
    final encryptedData = await _secureStorage.read(key: 'encrypted_data');
    final storedIv = await _secureStorage.read(key: 'encryption_iv');

    if (encryptedData == null || storedIv == null) {
      print('No data found');
      return null;
    }

    final iv = encrypt.IV.fromBase64(storedIv);
    final decryptedData = _encrypter.decrypt64(encryptedData, iv: iv);

    return decryptedData;
  }

  // Clear all stored data
  Future<void> clearStorage() async {
    await _secureStorage.delete(key: 'encrypted_data');
    await _secureStorage.delete(key: 'encryption_iv');
    print('Secure storage cleared!');
  }
}
*/
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SecureStorageService {
  // Private static instance
  static final SecureStorageService _instance = SecureStorageService._internal();

  // Secure storage instance
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Encryption setup
  late final encrypt.Key _key; // Declare key as late
  late final encrypt.IV _iv; // Declare IV as late
  late final encrypt.Encrypter _encrypter;

  // Private constructor
  SecureStorageService._internal() {
    // Initialize key, IV, and encrypter inside the constructor body
    _key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1');
    _iv = encrypt.IV.fromLength(16);
    _encrypter = encrypt.Encrypter(encrypt.AES(_key));
  }

  // Factory method to return the same instance
  factory SecureStorageService() {
    return _instance;
  }

  // Encrypt and store data
  Future<void> encryptAndStoreApiResponse(String apiResponse) async {
    final encryptedData = _encrypter.encrypt(apiResponse, iv: _iv);

    await _secureStorage.write(key: 'encrypted_data', value: encryptedData.base64);
    await _secureStorage.write(key: 'encryption_iv', value: _iv.base64);

    print('Data encrypted and stored securely!');
  }

  // Retrieve and decrypt data
  Future<String?> retrieveAndDecryptApiResponse() async {
    final encryptedData = await _secureStorage.read(key: 'encrypted_data');
    final storedIv = await _secureStorage.read(key: 'encryption_iv');

    if (encryptedData == null || storedIv == null) {
      print('No data found');
      return null;
    }

    final iv = encrypt.IV.fromBase64(storedIv);
    final decryptedData = _encrypter.decrypt64(encryptedData, iv: iv);

    return decryptedData;
  }

  // Clear all stored data
  Future<void> clearStorage() async {
    await _secureStorage.delete(key: 'encrypted_data');
    await _secureStorage.delete(key: 'encryption_iv');
    print('Secure storage cleared!');
  }
}

/**
 * How to use
 * void main() async {
    final secureStorageService = SecureStorageService();

    // Encrypt and store API response
    const apiResponse = '{"name": "John Doe", "age": 30}';
    await secureStorageService.encryptAndStoreApiResponse(apiResponse);

    // Retrieve and decrypt API response
    final decryptedResponse = await secureStorageService.retrieveAndDecryptApiResponse();
    print('Decrypted Response: $decryptedResponse');

    // Clear stored data
    await secureStorageService.clearStorage();
    }

 * **/