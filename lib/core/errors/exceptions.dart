class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});
}

class ServerException extends AppException {
  ServerException({required super.message, super.statusCode});
}

class CacheException extends AppException {
  CacheException({required super.message});
}

class NetworkException extends AppException {
  NetworkException({required super.message});
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required super.message, super.statusCode});
}
