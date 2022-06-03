import '../libs.dart';

class PostModel{
  late String title;
  late String desc;
  late UserModel publisher;
  late ForumModel forum;
  late DateTime publishTime;
  late List<UserModel> upVotedUsers;
  late List<UserModel> downVotedUsers;
  late List<CommentModel> comments;
  late Image? postImage;
  late int commentsCount;

  PostModel({required this.title, required this.desc, required this.publisher, required this.forum,
    required this.publishTime, required this.upVotedUsers,
    required this.downVotedUsers, this.postImage=null, required this.comments, required this.commentsCount});


  bool hasImage(){
    return postImage!=null;
  }


  int postScore(){
    return upVotedUsers.length - downVotedUsers.length;
  }

  bool anyVotes(){
    return upVotedUsers.isNotEmpty || downVotedUsers.isNotEmpty;
  }

  bool userUpVoted(UserModel user){
    return upVotedUsers.contains(user);
  }

  bool userDownVoted(UserModel user){
    return downVotedUsers.contains(user);
  }

  bool userVoted(UserModel user){
    return downVotedUsers.contains(user) || upVotedUsers.contains(user);
  }

  bool userNotVoted(UserModel user){
    return !userVoted(user);
  }
}