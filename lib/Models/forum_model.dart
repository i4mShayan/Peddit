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

  ForumModel({required this.owner, required this.admins, required this.posts, required this.members,
    this.forumName="ForumName", this.forumDesc="description", required this.forumCreateTime, required this.profileImage});
}