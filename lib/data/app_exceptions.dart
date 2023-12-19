class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Timeout Error');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Invalid Parameter Error');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Invalid Token Error');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input Error');
}
