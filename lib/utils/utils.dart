import 'package:flutter/material.dart';
import 'package:intelligent_innovation/models/users.dart';
import 'package:date_format/date_format.dart';

Color white = Colors.white;
Color black = Colors.black;
const String baseurl = 'https://dummyapi.io/data/api/';
const String apiKey = '6101d61ef14b095aa45d3e7b';
const int limit = 100;
const String getUserEndpoint = 'user?limit=$limit';

String formatLocation(Location location) {
  return "${location.street} ${location.city} ${location.state}, ${location.country}";
}

String getStringDate(DateTime date) {
  return (formatDate(date, [dd, '-', M, '-', yyyy]));
}
