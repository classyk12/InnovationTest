import 'dart:convert';

import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/services/resources.dart';
import 'package:intelligent_innovation/utils/error.dart';
import 'package:intelligent_innovation/utils/utils.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';

class UserService extends ResourceService {
  // ResourceService _resourceService = new ResourceService();

  Future<UserModel>? getUsers() async {
    //  await APICacheManager().emptyCache();
    //print('deleted');
    var res = null;
    try {
      var isExist = await APICacheManager().isAPICacheKeyExist('users');
      if (!isExist) {
        res = await get(getUserEndpoint);
        APICacheDBModel model =
            APICacheDBModel(key: 'users', syncData: json.encode(res.body));
        await APICacheManager().addCacheData(model);

        print('cached');
        return UserModel.fromJson(res.body);
      } else {
        var data = await APICacheManager().getCacheData('users');
        var users = json.decode(data.syncData);
        return UserModel.fromJson(users);
      }
    } catch (e) {
      return returnResponse(res);
    }
  }

  Future<UserDetailModel>? getUserById(String id) async {
    var res = await get('user/$id');
    try {
      return UserDetailModel.fromJson(res.body);
    } catch (e) {
      return returnResponse(res);
    }
  }
}
