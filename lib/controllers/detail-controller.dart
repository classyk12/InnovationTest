// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:intelligent_innovation/controllers/home-controller.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/services/user-service.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var _userService = Get.put(UserService());
  var progress = LoadingEnum.loading.obs;
  var detail = new UserDetailModel().obs;
  var error = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () => getUserDetail());
  }

  Future getUserDetail() async {
    try {
      progress.value = LoadingEnum.loading;
      var response = await _userService.getUserById(detail.value!.id!);

      if (response != null) {
        progress.value = LoadingEnum.done;
        detail.value = response;
      } else {
        progress.value = LoadingEnum.failed;
      }
    } catch (err) {
      progress.value = LoadingEnum.failed;
      error.value = err.toString();
    }
  }
}
