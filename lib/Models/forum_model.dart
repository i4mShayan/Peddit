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

  ForumModel({required this.owner, this.admins=const [], this.posts=const [], this.members=const [],
    this.forumName="ForumName", this.forumDesc="description", required this.forumCreateTime, required this.profileImage});
}