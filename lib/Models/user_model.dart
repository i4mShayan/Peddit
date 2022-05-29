import '../libs.dart';

class UserModel {
  late String userName;
  late String email;
  late List<ForumModel> followedForums;
  late List<CommentModel> comments;
  late List<PostModel> userPosts;
  late List<PostModel> upVotedPosts;
  late List<PostModel> downVotedPosts;
  late List<PostModel> savedPosts;
  late List<CommentModel> likedComments;
  late List<CommentModel> disLikedComments;
  late List<ForumModel> starredForums;
  late Image userProfileImage;

  UserModel({required this.userName, required this.email, required this.followedForums, required this.starredForums, this.comments=const [],
    this.userPosts=const [], this.upVotedPosts=const [], this.downVotedPosts=const [], this.savedPosts=const [],
    this.likedComments=const [], this.disLikedComments=const [], required this.userProfileImage});
}