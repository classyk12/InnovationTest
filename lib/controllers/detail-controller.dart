// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:intelligent_innovation/controllers/home-controller.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/services/user-service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var _userService = Get.put(UserService());
  var progress = LoadingEnum.loading.obs;
  var detail = new UserDetailModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetail();
  }

  Future getUserDetail() async {
    try {
      var response = await _userService.getUserById(detail.value.id!);
      progress.value = LoadingEnum.done;
      if (response != null) {
        detail.value = response;
      } else {
        progress.value = LoadingEnum.failed;
        print('failed');
      }
    } catch (err) {
      progress.value = LoadingEnum.failed;
      print('failed');
    }
  }
}
