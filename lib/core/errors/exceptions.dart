class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({required this.message, this.statusCode});
}

class ServerException extends AppException {
  const ServerException({required super.message, super.statusCode});
}

class CacheException extends AppException {
  const CacheException({required super.message});
}

class NetworkException extends AppException {
  const NetworkException({required super.message});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({required super.message, super.statusCode});
}

class UnknownException extends AppException {
  const UnknownException({
    required super.message,
    super.statusCode,
    this.exception,
  });

  final Exception? exception;

  @override
  String toString() {
    return '$message, ${exception?.toString()}';
  }
}
