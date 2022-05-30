import '../libs.dart';

class ForumModel{
  late UserModel owner;
  late List<UserModel> admins;
  late List<PostModel> posts;
  late List<UserModel> members;
  late String forumName;
  late String forumDesc;
  late DateTime forumCreateTime;
  late Image profileImage;
  late Image headerImage;

  ForumModel({required  , required this.owner, required this.admins, required this.posts, required this.members,
    required this.forumName, required this.forumDesc, required this.forumCreateTime, required this.profileImage , required this.headerImage});
}