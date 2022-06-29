// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumModel _$ForumModelFromJson(Map<String, dynamic> json) => ForumModel(
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      admins: (json['admins'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      blockedUsers: (json['blockedUsers'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      forumName: json['forumName'] as String,
      forumDesc: json['forumDesc'] as String,
      forumCreateTime: DateTime.parse(json['forumCreateTime'] as String),
      profileImage:
          ForumModel._imageFromBase64String(json['profileImage'] as String),
      headerImage:
          ForumModel._imageFromBase64String(json['headerImage'] as String),
    );

Map<String, dynamic> _$ForumModelToJson(ForumModel instance) =>
    <String, dynamic>{
      'owner': instance.owner.toJson(),
      'admins': instance.admins.map((e) => e.toJson()).toList(),
      'blockedUsers': instance.blockedUsers.map((e) => e.toJson()).toList(),
      'members': instance.members.map((e) => e.toJson()).toList(),
      'posts': instance.posts.map((e) => e.toJson()).toList(),
      'forumName': instance.forumName,
      'forumDesc': instance.forumDesc,
      'forumCreateTime': instance.forumCreateTime.toIso8601String(),
      'profileImage': ForumModel._Base64StringFromImage(instance.profileImage),
      'headerImage': ForumModel._Base64StringFromImage(instance.headerImage),
    };
