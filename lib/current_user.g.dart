// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) => CurrentUser()
  ..user = UserModel.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$CurrentUserToJson(CurrentUser instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
    };
