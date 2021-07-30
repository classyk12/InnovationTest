import 'package:intelligent_innovation/models/users.dart';
import 'package:intelligent_innovation/services/resources.dart';
import 'package:intelligent_innovation/utils/error.dart';
import 'package:intelligent_innovation/utils/utils.dart';

class UserService extends ResourceService {
  // ResourceService _resourceService = new ResourceService();

  Future<UserModel>? getUsers() async {
    var res = await get(getUserEndpoint);
    try {
      return UserModel.fromJson(res.body);
    } catch (e) {
      return returnResponse(res);
    }
  }

// catch (e) {
  //   return returnResponse(res);
  // }
  Future<UserDetailModel>? getUserById(String id) async {
    var res = await get('user/$id');
    try {
      return UserDetailModel.fromJson(res.body);
    } catch (e) {
      return returnResponse(res);
    }
  }
}
