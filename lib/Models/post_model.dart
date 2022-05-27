import '/libs.dart';

class PostModel{
  String _title;
  String _desc;
  UserModel _usr;
  ForumModel _forum;
  DateTime _time;
  bool _hasImage;
  List<UserModel> _upVotedUsers;
  List<UserModel> _downVotedUsers;
  List<CommentModel> _comments;
  Image _postImage;


  PostModel(
      this._title,
      this._desc,
      this._usr,
      this._forum,
      this._time,
      this._hasImage,
      this._upVotedUsers,
      this._downVotedUsers,
      this._comments,
      this._postImage);


  Image get postImage => _postImage;

  set postImage(Image value) {
    _postImage = value;
  }

  List<CommentModel> get comments => _comments;

  set comments(List<CommentModel> value) {
    _comments = value;
  }

  List<UserModel> get upVotedUsers => _upVotedUsers;

  set upVotedUsers(List<UserModel> value) {
    _upVotedUsers = value;
  }

  bool get hasImage => _hasImage;

  set hasImage(bool value) {
    _hasImage = value;
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  ForumModel get forum => _forum;

  set forum(ForumModel value) {
    _forum = value;
  }

  UserModel get usr => _usr;

  set usr(UserModel value) {
    _usr = value;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  List<UserModel> get downVotedUsers => _downVotedUsers;

  set downVotedUsers(List<UserModel> value) {
    _downVotedUsers = value;
  }
}