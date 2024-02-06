import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/services/newtork_coller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileDataController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  bool _isProfileComplited = false;

  bool get isProfileCompleted => _isProfileComplited;

  Future<bool> readProfileData(String token) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.readProfile, token: token);
    _inProgress = false;
    if (response.isSuccess) {
      final profileData = response.responseData['data'];
      if (profileData == null) {
        _isProfileComplited = false;
      } else {
        _profile = Profile.fromJson(profileData[0]);
        _isProfileComplited = true;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
