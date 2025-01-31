class Consts {
  // Private constructor
  Consts._privateConstructor();

  // Singleton instance
  static final Consts _instance = Consts._privateConstructor();

  // Factory constructor to return the same instance
  factory Consts() {
    return _instance;
  }

  // Static constants
  static String get debugBanner => 'debugBanner';
  static String get extensionSvg => '.svg';
  static String get extensionPng => '.png';
  static String get baseUrl => 'https://api.api-ninjas.com/';

}
