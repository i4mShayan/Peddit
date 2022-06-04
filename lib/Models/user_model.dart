import '../libs.dart';

class UserModel {
  late String userName;
  late String email;
  late String password;
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

  UserModel({required this.userName, required this.email, required this.followedForums, required this.starredForums, required this.comments,
    required this.userPosts, required this.upVotedPosts, required this.downVotedPosts, required this.savedPosts,
    required this.likedComments, required this.disLikedComments, required this.userProfileImage, required this.password});

  bool savedThisPost(PostModel post){
    return savedPosts.contains(post);
  }
}