// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      followedForums: (json['followedForums'] as List<dynamic>)
          .map((e) => ForumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      starredForums: (json['starredForums'] as List<dynamic>)
          .map((e) => ForumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      savedPosts: (json['savedPosts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userProfileImage:
          UserModel._imageFromBase64String(json['userProfileImage'] as String),
      password: json['password'] as String,
      userPostsCount: json['userPostsCount'] as int,
      commentsCount: json['commentsCount'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'followedForums': instance.followedForums.map((e) => e.toJson()).toList(),
      'commentsCount': instance.commentsCount,
      'userPostsCount': instance.userPostsCount,
      'savedPosts': instance.savedPosts.map((e) => e.toJson()).toList(),
      'starredForums': instance.starredForums.map((e) => e.toJson()).toList(),
      'userProfileImage':
          UserModel._Base64StringFromImage(instance.userProfileImage),
    };
