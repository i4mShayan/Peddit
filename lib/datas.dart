import 'libs.dart';

class Datas{
  Image defaultProfilePicture=Image.asset("assets/images/default_profile_picture.png");
  late UserModel currentUser=UserModel("username", "email@gmail.com", forumsList, [], [], [], [], [], [], [], [], defaultProfilePicture);
  late List<UserModel> usersList=[currentUser];
  late List<ForumModel> forumsList=[
    ForumModel(currentUser, [currentUser], [], [], "forum0!", "desc!", DateTime.now()),
    ForumModel(currentUser, [currentUser], [], [], "forum1!", "desc!", DateTime.now()),
    ForumModel(currentUser, [currentUser], [], [], "forum2!", "desc!", DateTime.now()),
    ForumModel(currentUser, [currentUser], [], [], "forum3!", "desc!", DateTime.now()),
  ];
  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

}