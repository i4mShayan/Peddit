import '../libs.dart';

class ForumModel{
  late UserModel owner;
  late List<UserModel> admins;
  late List<UserModel> blockedUsers;
  late List<UserModel> members;
  late List<PostModel> posts;
  late String forumName;
  late String forumDesc;
  late DateTime forumCreateTime;
  late Image profileImage;
  late Image headerImage;

  ForumModel({required  , required this.owner, required this.admins, required this.members, required this.blockedUsers, required this.posts,
    required this.forumName, required this.forumDesc, required this.forumCreateTime, required this.profileImage , required this.headerImage});

  int membersCount(){
    return 1 + members.length + admins.length;
  }

  void addPost(PostModel post){
    posts.insert(0, post);
  }
}