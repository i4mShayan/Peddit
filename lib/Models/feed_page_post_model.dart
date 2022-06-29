import '../libs.dart';

part 'feed_page_post_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedPagePostsForCurrentUser {
  late List<PostModel> posts;

  FeedPagePostsForCurrentUser({required this.posts});

  factory FeedPagePostsForCurrentUser.fromJson(Map<String, dynamic> json) => _$FeedPagePostsForCurrentUserFromJson(json);
  Map<String, dynamic> toJson() => _$FeedPagePostsForCurrentUserToJson(this);
}