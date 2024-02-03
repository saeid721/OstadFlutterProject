import 'package:crafty_bay/data/services/newtork_coller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class verifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress =>_inProgress;
  Future<bool> verifyOTP(String email, String otp) async{
    _inProgress = true;
    update();
    final responsee = await NetworkCaller().getRequest(Urls());
  }
}