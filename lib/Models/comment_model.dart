import '../libs.dart';

part 'comment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommentModel{
  late UserModel publisher;
  late DateTime publishTime;
  late String commentDesc;
  late List<UserModel> upVotedUsers;
  late List<UserModel> downVotedUsers;
  late List<CommentModel> repliedComments;

  int commentScore(){
    return upVotedUsers.length - downVotedUsers.length;
  }


  CommentModel({required this.publisher, required this.publishTime,
    required this.commentDesc,
    required this.upVotedUsers, required this.downVotedUsers ,  required this.repliedComments,
  });

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

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

}