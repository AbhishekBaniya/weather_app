class BoolManager {
  // Private static instance
  static final BoolManager _instance = BoolManager._internal();

  // Private constructor
  BoolManager._internal();

  // Factory constructor to return the same instance
  factory BoolManager() {
    return _instance;
  }

  // Map to store multiple boolean states
  final Map<String, bool> _boolStates = {};

  // Method to set a boolean state
  void setBool(String key, bool value) {
    _boolStates[key] = value;
  }

  // Method to get a boolean state
  bool getBool(String key) {
    return _boolStates[key] ?? false; // Return `false` if the key doesn't exist
  }

  // Method to toggle a boolean state
  void toggleBool(String key) {
    _boolStates[key] = !(_boolStates[key] ?? false);
  }

  // Method to clear a specific boolean state
  void clearBool(String key) {
    _boolStates.remove(key);
  }

  // Method to clear all boolean states
  void clearAll() {
    _boolStates.clear();
  }
}

/**
 * Setting and Getting Booleans
 * void main() {
    // Access the singleton instance
    final boolManager = BoolManager();

    // Set a boolean state
    boolManager.setBool('isLoggedIn', true);

    // Get a boolean state
    print('isLoggedIn: ${boolManager.getBool('isLoggedIn')}'); // Output: isLoggedIn: true

    // Set another boolean state
    boolManager.setBool('hasNotifications', false);
    print('hasNotifications: ${boolManager.getBool('hasNotifications')}'); // Output: hasNotifications: false
    }
 **/
/**
 * Toggling and Clearing Booleans
 * void main() {
    // Access the singleton instance
    final boolManager = BoolManager();

    // Set a boolean state
    boolManager.setBool('isDarkMode', false);

    // Toggle the boolean state
    boolManager.toggleBool('isDarkMode');
    print('isDarkMode: ${boolManager.getBool('isDarkMode')}'); // Output: isDarkMode: true

    // Clear a specific boolean state
    boolManager.clearBool('isDarkMode');
    print('isDarkMode: ${boolManager.getBool('isDarkMode')}'); // Output: isDarkMode: false

    // Clear all boolean states
    boolManager.clearAll();
    }

 * **/