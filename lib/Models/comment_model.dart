import '../libs.dart';

class CommentModel{
  late UserModel publisher;
  // late PostModel post;
  // late ForumModel forum;
  late DateTime publishTime;
  late String commentDesc;
  late List<UserModel> usersReplied;
  late List<UserModel> upVotedUsers;
  late List<UserModel> downVotedUsers;

  CommentModel({required this.publisher, required this.publishTime,
    required this.commentDesc, required this.usersReplied,
    required this.upVotedUsers, required this.downVotedUsers,
  });


  int commentScore(){
    return upVotedUsers.length - downVotedUsers.length;
  }

  bool anyVotes(){
    return upVotedUsers.length!=0 || downVotedUsers.length!=0;
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