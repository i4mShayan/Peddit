import 'libs.dart';

class Datas{
  Image defaultProfilePicture=Image.asset("assets/images/default_profile.png");
  Image defaultBackground=Image.asset("assets/images/default_background.png");
  late UserModel currentUser=UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
  followedForums: forumsList, starredForums: []);
  late List<UserModel> usersList=[currentUser];
  late List<ForumModel> forumsList=[
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: []),
        forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture),
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: []),
        forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture),
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: []),
        forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture),
  ];
  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

}