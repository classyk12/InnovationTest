// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

// Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
//       'data': instance.data,
//       'total': instance.total,
//       'page': instance.page,
//       'limit': instance.limit,
//       'offset': instance.offset,
//     };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      picture: json['picture'] as String?,
    );

// Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
//       'id': instance.id,
//       'title': instance.title,
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'email': instance.email,
//       'picture': instance.picture,
//     };

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      phone: json['phone'] as String?,
      picture: json['picture'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      registerDate: json['registerDate'] == null
          ? null
          : DateTime.parse(json['registerDate'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

// Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'title': instance.title,
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'gender': instance.gender,
//       'email': instance.email,
//       'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
//       'phone': instance.phone,
//       'picture': instance.picture,
//       'location': instance.location,
//       'registerDate': instance.registerDate?.toIso8601String(),
//       'updatedAt': instance.updatedAt?.toIso8601String(),
//     };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      timezone: json['timezone'] as String?,
    );

// Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
//       'street': instance.street,
//       'city': instance.city,
//       'state': instance.state,
//       'country': instance.country,
//       'timezone': instance.timezone,
//     };
