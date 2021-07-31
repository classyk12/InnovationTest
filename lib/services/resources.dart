// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:intelligent_innovation/utils/utils.dart';

class ResourceService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseurl;
    httpClient.defaultContentType = "json";
    httpClient.timeout = Duration(seconds: 30);

    httpClient.addRequestModifier((request) async {
      request.headers.addAll({'app-id': apiKey});

      return request;
    });
    super.onInit();
  }
}
