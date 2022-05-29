import '../libs.dart';

class CommentModel{
  late UserModel publisher;
  late PostModel post;
  late ForumModel forum;
  late DateTime time;
  late String commentDesc;
  late List<UserModel> likedUsers;
  late List<UserModel> disLikedUsers;
  late List<UserModel> usersReplied;

  CommentModel({required this.publisher, required this.post, required this.forum, required this.time,
    required this.commentDesc,
    this.likedUsers=const [], this.disLikedUsers=const [], this.usersReplied=const [],
  });
}