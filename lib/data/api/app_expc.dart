class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _perfix;
  AppException(this._message, this._perfix, );
  @override
  String toString (){
    return '$_message$_perfix';
  }

}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super (message, "Error During Communication");
}

class BadRequestException extends AppException{
  BadRequestException ([String? message]) : super (message, "Invalid Request");

}

class UnauthorisedException extends AppException{
  UnauthorisedException ([String? message]) : super (message, "Unauthorised Request");
}