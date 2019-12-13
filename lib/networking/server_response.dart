class ServerResponse<T extends Object> {
  T responseObject ;
  String errorMessage;

  ServerResponse(T responseObject, String errorMessage) {
    this.responseObject = responseObject;
    this.errorMessage = errorMessage;
  }
}