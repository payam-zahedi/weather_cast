class AppConstants {
  // API Timeouts
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // SharedPreferences Keys
  static const String tokenKey = 'token';
  static const String userKey = 'user';
  static const String themeKey = 'theme';
  static const String languageKey = 'language';
  static const String lastWeatherKey = 'last_weather';
  static const String savedCitiesKey = 'saved_cities';

  // Error Messages
  static const String connectionError = 'Please check your internet connection';
  static const String serverError = 'Server error, please try again later';
  static const String authError = 'Authentication failed';
  static const String cityNotFoundError = 'City not found';

  // Animation Duration
  static const Duration animationDuration = Duration(milliseconds: 300);
}
