import 'dart:convert';

import 'package:http/http.dart';

class NetworkCaller {
  Future postRequest(String rul, {Map<String, dynamic>? body}) async {
    try {
      final Response response = await post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {'Content-type': 'Application/json'});
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {}
  }
}
