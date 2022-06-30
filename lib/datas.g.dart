// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas()
  ..forumsList = (json['forumsList'] as List<dynamic>)
      .map((e) => ForumModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..feedPosts = (json['feedPosts'] as List<dynamic>)
      .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'forumsList': instance.forumsList.map((e) => e.toJson()).toList(),
      'feedPosts': instance.feedPosts.map((e) => e.toJson()).toList(),
    };
