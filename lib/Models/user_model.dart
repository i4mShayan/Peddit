import '../libs.dart';

class UserModel {
  late String userName;
  late String email;
  late String password;
  late List<ForumModel> followedForums;
  late int commentsCount;
  late int userPostsCount;
  late List<PostModel> savedPosts;
  late List<ForumModel> starredForums;
  late Image userProfileImage;

  UserModel({required this.userName, required this.email,
    required this.followedForums, required this.starredForums,required this.savedPosts,
    required this.userProfileImage, required this.password, required this.userPostsCount, required this.commentsCount});

  bool savedThisPost(PostModel post){
    return savedPosts.contains(post);
  }
}