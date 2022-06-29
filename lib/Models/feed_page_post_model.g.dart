// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_page_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedPagePostsForCurrentUser _$FeedPagePostsForCurrentUserFromJson(
        Map<String, dynamic> json) =>
    FeedPagePostsForCurrentUser(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedPagePostsForCurrentUserToJson(
        FeedPagePostsForCurrentUser instance) =>
    <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
