class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey =
      'YOUR_API_KEY'; // Replace with your actual API key

  // API Endpoints
  static const String currentWeatherEndpoint = '/weather';
  static const String forecastEndpoint = '/forecast';

  // Parameters
  static const String apiKeyParam = 'appid';
  static const String cityNameParam = 'q';

  // Image URL
  static const String weatherIconBaseUrl = 'https://openweathermap.org/img/wn/';
  static const String weatherIconSuffix = '@2x.png';

  // Get full icon URL
  static String getIconUrl(String iconCode) =>
      '$weatherIconBaseUrl$iconCode$weatherIconSuffix';
}
