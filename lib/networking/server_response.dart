import 'dart:convert';

class ServerResponse<T extends Object> {
  T responseObject ;
  Exception serverException ;

  ServerResponse(T object, Exception exception) {
    responseObject = object;
    serverException = exception;
  }
}