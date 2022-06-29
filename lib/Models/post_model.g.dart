// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      title: json['title'] as String,
      desc: json['desc'] as String,
      publisher: UserModel.fromJson(json['publisher'] as Map<String, dynamic>),
      forum: ForumModel.fromJson(json['forum'] as Map<String, dynamic>),
      publishTime: DateTime.parse(json['publishTime'] as String),
      upVotedUsers: (json['upVotedUsers'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      downVotedUsers: (json['downVotedUsers'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      postImage: json['postImage'] == null
          ? null
          : PostModel._imageFromBase64String(json['postImage'] as String),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentsCount: json['commentsCount'] as int,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'publisher': instance.publisher.toJson(),
      'forum': instance.forum.toJson(),
      'publishTime': instance.publishTime.toIso8601String(),
      'upVotedUsers': instance.upVotedUsers.map((e) => e.toJson()).toList(),
      'downVotedUsers': instance.downVotedUsers.map((e) => e.toJson()).toList(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'postImage': PostModel._Base64StringFromImage(instance.postImage),
      'commentsCount': instance.commentsCount,
    };
