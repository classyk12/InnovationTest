// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:get/get.dart';

dynamic returnResponse(Response response) {
  print(response.toString());
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      var responseJson = response.body.toString();
      return responseJson;
    case 500:
      throw "Server Error pls retry later";
    case 403:
      throw 'Error occurred pls check internet and retry.';
    default:
      throw 'Error occurred while Communication with Server';
  }
}
