class CustomResponse {
  dynamic data;
  String message;
  int statusCode;

  CustomResponse(
      {required this.data, required this.message, required this.statusCode});

  @override
  String toString() {
    return 'Response {data: $data,message: $message,statusCode: $statusCode,}';
  }
}
