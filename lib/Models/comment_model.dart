import '/libs.dart';

class CommentModel{
  UserModel _usr;
  PostModel _post;
  ForumModel _forum;
  DateTime _time;
  String _commentDesc;
  List<UserModel> _likedUsers;
  List<UserModel> _disLikedUsers;
  List<UserModel> _repliedComments;


  CommentModel(
      this._usr,
      this._post,
      this._forum,
      this._time,
      this._commentDesc,
      this._likedUsers,
      this._disLikedUsers,
      this._repliedComments);


  List<UserModel> get repliedComments => _repliedComments;

  set repliedComments(List<UserModel> value) {
    _repliedComments = value;
  }

  List<UserModel> get likedUsers => _likedUsers;

  set likedUsers(List<UserModel> value) {
    _likedUsers = value;
  }

  String get commentDesc => _commentDesc;

  set commentDesc(String value) {
    _commentDesc = value;
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  ForumModel get forum => _forum;

  set forum(ForumModel value) {
    _forum = value;
  }

  PostModel get post => _post;

  set post(PostModel value) {
    _post = value;
  }

  UserModel get usr => _usr;

  set usr(UserModel value) {
    _usr = value;
  }

  List<UserModel> get disLikedUsers => _disLikedUsers;

  set disLikedUsers(List<UserModel> value) {
    _disLikedUsers = value;
  }
}