import 'dart:convert';
import 'dart:io';
import '../libs.dart';

part 'forum_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ForumModel{
  late String forumName;
  late UserModel owner;
  late List<UserModel> admins;
  late List<UserModel> blockedUsers;
  late List<UserModel> members;
  late List<PostModel> posts;
  late String forumDesc;
  late DateTime forumCreateTime;
  @JsonKey(
    toJson: _Base64StringFromImage,
    fromJson: _imageFromBase64String
  )
  late Image profileImage;
  @JsonKey(
      toJson: _Base64StringFromImage,
      fromJson: _imageFromBase64String
  )
  late Image headerImage;

  ForumModel({required  , required this.owner, required this.admins, required this.members, required this.blockedUsers, required this.posts,
    required this.forumName, required this.forumDesc, required this.forumCreateTime, required this.profileImage , required this.headerImage});

  int membersCount(){
    return 1 + members.length + admins.length;
  }

  void addPost(PostModel post){
    posts.insert(0, post);
  }
  factory ForumModel.fromJson(Map<String, dynamic> json) => _$ForumModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForumModelToJson(this);

  static Image _imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static String _Base64StringFromImage(Image img){
    return "";
  }

}