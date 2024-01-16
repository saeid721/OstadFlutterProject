class ResponseData {
  final bool isSuccess;
  final int stateCode;
  final dynamic responseData;
  ResponseData ({
    required this.isSuccess,
    required this.stateCode,
    required this.responseData,
  });
}