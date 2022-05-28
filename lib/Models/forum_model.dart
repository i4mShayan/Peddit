import '../libs.dart';

class ForumModel{
  UserModel _owner;
  List<UserModel> _admins;
  List<PostModel> _posts;
  List<UserModel> _members;
  String _forumName;
  String _forumDesc;
  DateTime _forumCreateTime;

  ForumModel(this._owner, this._admins, this._posts, this._members,
      this._forumName, this._forumDesc, this._forumCreateTime);

  DateTime get forumCreateTime => _forumCreateTime;

  set forumCreateTime(DateTime value) {
    _forumCreateTime = value;
  }

  String get forumDesc => _forumDesc;

  set forumDesc(String value) {
    _forumDesc = value;
  }

  String get forumName => _forumName;

  set forumName(String value) {
    _forumName = value;
  }

  List<UserModel> get members => _members;

  set members(List<UserModel> value) {
    _members = value;
  }

  List<PostModel> get posts => _posts;

  set posts(List<PostModel> value) {
    _posts = value;
  }

  List<UserModel> get admins => _admins;

  set admins(List<UserModel> value) {
    _admins = value;
  }

  UserModel get owner => _owner;

  set owner(UserModel value) {
    _owner = value;
  }
}