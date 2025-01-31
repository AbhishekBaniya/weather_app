import 'dart:async';
import 'dart:developer';

class Logger {
  // Singleton pattern to ensure only one instance of Logger is created
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  // Info log
  void info(String message) => _log('INFO', message);

  // Warning log
  void warning(String message) => _log('WARNING', message);

  // Error log
  void error(String message) => _log('ERROR', message);

  // Internal method to handle logging
  void _log(String level, String message,) {
    final timestamp = DateTime.now().toIso8601String();
    log('[$timestamp] $level: $message', zone: Zone.root, time: DateTime.now(),);
  }
}