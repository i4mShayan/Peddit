import '../libs.dart';

class UserModel {
  String _userName;
  String _email;
  List<ForumModel> _followedForums;
  List<CommentModel> _comments;
  List<PostModel> _userPosts;
  List<PostModel> _upVotedPosts;
  List<PostModel> _downVotedPosts;
  List<PostModel> _savedPosts;
  List<CommentModel> _likedComment;
  List<CommentModel> _disLikedComments;
  List<ForumModel> _starredForums;
  Image _usrProfileImage;

  UserModel(
      this._userName,
      this._email,
      this._followedForums,
      this._comments,
      this._userPosts,
      this._upVotedPosts,
      this._downVotedPosts,
      this._savedPosts,
      this._likedComment,
      this._disLikedComments,
      this._starredForums,
      this._usrProfileImage);


  Image get usrProfileImage => _usrProfileImage;

  set usrProfileImage(Image value) {
    _usrProfileImage = value;
  }

  List<CommentModel> get disLikedComments => _disLikedComments;

  set disLikedComments(List<CommentModel> value) {
    _disLikedComments = value;
  }

  List<CommentModel> get likedComment => _likedComment;

  set likedComment(List<CommentModel> value) {
    _likedComment = value;
  }

  List<PostModel> get savedPosts => _savedPosts;

  set savedPosts(List<PostModel> value) {
    _savedPosts = value;
  }

  List<PostModel> get downVotedPosts => _downVotedPosts;

  set downVotedPosts(List<PostModel> value) {
    _downVotedPosts = value;
  }

  List<PostModel> get upVotedPosts => _upVotedPosts;

  set upVotedPosts(List<PostModel> value) {
    _upVotedPosts = value;
  }

  List<PostModel> get userPosts => _userPosts;

  set userPosts(List<PostModel> value) {
    _userPosts = value;
  }

  List<CommentModel> get comments => _comments;

  set comments(List<CommentModel> value) {
    _comments = value;
  }

  List<ForumModel> get followedForums => _followedForums;

  set followedForums(List<ForumModel> value) {
    _followedForums = value;
  }

  List<ForumModel> get starredForums => _starredForums;

  set starredForums(List<ForumModel> value) {
    _starredForums = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }
}