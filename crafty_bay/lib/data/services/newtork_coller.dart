import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/data/models/response_data.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(String url) async {
    log(url);
    final Response response = await get(Uri.parse(url));
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
            isSuccess: true,
            stateCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
            isSuccess: true,
            stateCode: response.statusCode,
            responseData: decodeResponse,
            errorMessage: decodeResponse['data'] ?? 'Something went wrong!',
        );
      }
    } else {
      return ResponseData(
          isSuccess: false, stateCode: response.statusCode, responseData: '');
    }
  }
    Future<ResponseData> postRequest(String url, {Map<String, dynamic> ? body}) async {
      
    log(url);
    log(body.toString());
    final Response response = await post(Uri.parse(url), body: jsonEncode(body));
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
            isSuccess: true,
            stateCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
            isSuccess: true,
            stateCode: response.statusCode,
            responseData: decodeResponse,
            errorMessage: decodeResponse['data'] ?? 'Something went wrong!',
            );
      }
    } else {
      return ResponseData(
          isSuccess: false, stateCode: response.statusCode, responseData: '');
    }
  }
}
