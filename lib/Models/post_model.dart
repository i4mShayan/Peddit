import 'dart:convert';

import '../libs.dart';

part 'post_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PostModel{
  late String title;
  late String desc;
  late UserModel publisher;
  late ForumModel forum;
  late DateTime publishTime;
  late List<UserModel> upVotedUsers;
  late List<UserModel> downVotedUsers;
  late List<CommentModel> comments;
  @JsonKey(
      toJson: _Base64StringFromImage,
      fromJson: _imageFromBase64String
  )
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

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  static Image? _imageFromBase64String(String base64String) {
    if(base64String.isEmpty) return null;
    return Image.memory(base64Decode(base64String));
  }

  static String _Base64StringFromImage(Image? img){
    return "";
  }
}