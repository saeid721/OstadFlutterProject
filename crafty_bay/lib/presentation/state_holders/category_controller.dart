import 'package:crafty_bay/data/models/banner_list_model.dart';
import 'package:crafty_bay/data/services/newtork_coller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CategoryListModel _categoryListModel = CategoryListModel();

  CategoryListModel get categoryListModel => _categoryListModel;

  Future<bool> getCategoryList() async {
    _inProgress = true;
    bool isSuccess = false;
    update();

    final response = await NetworkCaller().getRequest(
      Urls.categoryList,
    );
    _inProgress = false;
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
