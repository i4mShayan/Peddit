// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumListModel _$ForumListModelFromJson(Map<String, dynamic> json) =>
    ForumListModel(
      forums: (json['forums'] as List<dynamic>)
          .map((e) => ForumModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForumListModelToJson(ForumListModel instance) =>
    <String, dynamic>{
      'forums': instance.forums.map((e) => e.toJson()).toList(),
    };
