class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
    : super(message, "Bad Request: ", url);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message, String? url])
    : super(message, "Unauthorized: ", url);
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message, String? url])
    : super(message, "Forbidden: ", url);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, String? url])
    : super(message, "Not Found: ", url);
}

class MethodNotAllowedException extends AppException {
  MethodNotAllowedException([String? message, String? url])
    : super(message, "Method Not Allowed: ", url);
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message, String? url])
    : super(message, "Request Timeout: ", url);
}

class SendTimeoutException extends AppException {
  SendTimeoutException([String? message, String? url])
    : super(message, "Send Timeout: ", url);
}

class ConflictException extends AppException {
  ConflictException([String? message, String? url])
    : super(message, "Conflict: ", url);
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message, String? url])
    : super(message, "Internal Server Error: ", url);
}

class ServiceUnavailableException extends AppException {
  ServiceUnavailableException([String? message, String? url])
    : super(message, "Service Unavailable: ", url);
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
    : super(message, "No Internet Connection: ");
}

class UnknownException extends AppException {
  UnknownException([String? message, String? url])
    : super(message, "Unknown Error: ", url);
}
