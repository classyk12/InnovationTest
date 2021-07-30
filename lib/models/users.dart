// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    this.data,
    this.total,
    this.page,
    this.limit,
    this.offset,
  });

  List<UserInfo>? data;
  int? total;
  int? page;
  int? limit;
  int? offset;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@JsonSerializable()
class UserInfo {
  UserInfo({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.picture,
  });

  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? email;
  String? picture;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable()
class UserDetailModel {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  DateTime? dateOfBirth;
  String? phone;
  String? picture;
  Location? location;
  DateTime? registerDate;
  DateTime? updatedAt;

  UserDetailModel({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.picture,
    this.location,
    this.registerDate,
    this.updatedAt,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);
}

@JsonSerializable()
class Location {
  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.timezone,
  });

  String? street;
  String? city;
  String? state;
  String? country;
  String? timezone;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
