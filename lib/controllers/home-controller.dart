// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/services/user-service.dart';
import 'package:get/get.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'dart:convert';

class HomeController extends GetxController {
  var _userService = Get.put(UserService());
  var progress = LoadingEnum.loading.obs;
  var users = <UserInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future getData() async {
    progress.value = LoadingEnum.loading;
    try {
      //check if data exist in cache already
      var isExist = await APICacheManager().isAPICacheKeyExist('users');
      if (!isExist) {
        var response = await _userService.getUsers();
        progress.value = LoadingEnum.done;
        if (response?.data != null) {
          users.assignAll(response?.data);
          //cache data
          APICacheDBModel model = APICacheDBModel(
              key: 'users', syncData: json.encode(response?.data));
          await APICacheManager().addCacheData(model);
          print('done');
        } else {
          progress.value = LoadingEnum.failed;
          print('failed');
        }
      } else {
        var data = await APICacheManager().getCacheData('users');
        users.assignAll(json.decode(data.syncData));
        print(users.length);
      }
    } catch (err) {
      progress.value = LoadingEnum.failed;
      print('failed');
    }
  }
}

enum LoadingEnum { loading, done, failed }
