class ResponseData {
  final bool isSuccess;
  final int stateCode;
  final String errorMessage;
  final dynamic responseData;
  ResponseData ({
    required this.isSuccess,
    required this.stateCode,
    required this.responseData,
    this.errorMessage = 'Somthing went wrong!', 
  });
}