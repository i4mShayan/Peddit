// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      publisher: UserModel.fromJson(json['publisher'] as Map<String, dynamic>),
      publishTime: DateTime.parse(json['publishTime'] as String),
      commentDesc: json['commentDesc'] as String,
      upVotedUsers: (json['upVotedUsers'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      downVotedUsers: (json['downVotedUsers'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      repliedComments: (json['repliedComments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'publisher': instance.publisher.toJson(),
      'publishTime': instance.publishTime.toIso8601String(),
      'commentDesc': instance.commentDesc,
      'upVotedUsers': instance.upVotedUsers.map((e) => e.toJson()).toList(),
      'downVotedUsers': instance.downVotedUsers.map((e) => e.toJson()).toList(),
      'repliedComments':
          instance.repliedComments.map((e) => e.toJson()).toList(),
    };
