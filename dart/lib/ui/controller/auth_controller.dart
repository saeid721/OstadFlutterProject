import 'package:module_twelve_task_manager/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  Future<void> saveUserInformation(String token, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  }
}
