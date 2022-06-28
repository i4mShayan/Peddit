import 'dart:convert';

import '../libs.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  late String userName;
  late String email;
  late String password;
  late List<ForumModel> followedForums;
  late List<CommentModel> comments;
  late List<PostModel> userPosts;
  late List<PostModel> upVotedPosts;
  late List<PostModel> downVotedPosts;
  late List<PostModel> savedPosts;
  late List<CommentModel> likedComments;
  late List<CommentModel> disLikedComments;
  late List<ForumModel> starredForums;
  @JsonKey(
      toJson: _Base64StringFromImage,
      fromJson: _imageFromBase64String
  )
  late Image userProfileImage;

  UserModel({required this.userName, required this.email, required this.followedForums, required this.starredForums, required this.comments,
    required this.userPosts, required this.upVotedPosts, required this.downVotedPosts, required this.savedPosts,
    required this.likedComments, required this.disLikedComments, required this.userProfileImage, required this.password});

  bool savedThisPost(PostModel post){
    return savedPosts.contains(post);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static Image _imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static String _Base64StringFromImage(Image img){
    return "";
  }
}