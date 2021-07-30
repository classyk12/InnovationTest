// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/services/user-service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var _userService = Get.put(UserService());
  var progress = LoadingEnum.loading.obs;
  var users = <UserInfo>[].obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData() async {
    progress.value = LoadingEnum.loading;
    try {
      var response = await _userService.getUsers();
      progress.value = LoadingEnum.done;
      if (response != null) {
        users.assignAll(response.data);
      } else {
        progress.value = LoadingEnum.failed;
      }
    } catch (err) {
      progress.value = LoadingEnum.failed;
      error.value = 'something went wrong';
      print('err');
    }
  }
}

enum LoadingEnum { loading, done, failed }
