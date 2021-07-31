// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
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
      throw 'Error  communicating with Server';
  }
}

HandleError(String error, void Function() action) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(error, style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      InkWell(
        onTap: () => action(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.refresh_outlined, color: Colors.blue[900]),
            Text('try again',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue[900])),
          ],
        ),
      ),
    ],
  ));
}
