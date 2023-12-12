import 'package:get/get.dart';

import '../../data/models/user_model.dart';
import '../../data/network_coller/network_coller.dart';
import '../../data/network_coller/network_response.dart';
import '../../data/utility/urls.dart';
import 'auth_controller.dart';

class LoginController extends GetxController {
  bool _loginInProgress = false;
  String _failedmessage = '';
  String get failedmessage => _failedmessage;
  bool get loginInProgress => _loginInProgress;
  Future<bool> login(String email, String password) async {
    _loginInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller().postRequest(Urls.login,
        body: {
          'email': email,
          'password': password,
        },
        isLogin: true);
    _loginInProgress = false;
    update();
    if (response.isSuccess) {
      await AuthController.saveUserInformation(response.jsonResponse['token'],
          UserModel.fromJson(response.jsonResponse['data']));
      return true;
    } else {
      if (response.statusCode == 401) {
        _failedmessage = 'Please check email/password';
      } else {
        _failedmessage = 'Login failed. Try again';
      }
    }
    return false;
  }
}
