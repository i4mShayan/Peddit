import 'libs.dart';

class Datas{
  ThemeMode themeMode=ThemeMode.dark;
  bool loggedIn = true;

  late UserModel currentUser=UserModel(userName: "username", email: "email@site.com", userProfileImage: Datas().defaultProfilePicture,
  followedForums: [], starredForums: [], savedPosts: [], password: 'Aaaa1234', commentsCount: 0, userPostsCount: 0);

  PageController pageController=PageController();
  int navigationSelectedIndex=0;
  Image defaultProfilePicture=Image.asset("assets/images/default_profile.png");
  Image defaultBackground=Image.asset("assets/images/default_background.png");


  late List<UserModel> adminsForTest=[
    for (int i=0; i<10; i++)
        UserModel(userName: "admin"+i.toString(), email: "email@site.com", followedForums: [], starredForums: [], savedPosts: [], userProfileImage: defaultProfilePicture, password: "Password1", userPostsCount: 0, commentsCount: 0),
  ];

  late List<UserModel> membersForTest=[
    for (int i=0; i<10; i++)
      UserModel(userName: "member"+i.toString(), email: "email@site.com", followedForums: [], starredForums: [], savedPosts: [], userProfileImage: defaultProfilePicture, password: "Password1", userPostsCount: 0, commentsCount: 0),
  ];

  late UserModel ownerForTest=UserModel(userName: "owner", email: "email@site.com", followedForums: [], starredForums: [], savedPosts: [], userProfileImage: defaultProfilePicture, password: "Password1", userPostsCount: 0, commentsCount: 0);

  late List<ForumModel> forumsList=[
    for (int i=0; i<10; i++)
      ForumModel(owner: ownerForTest, admins: adminsForTest, members: [], blockedUsers: [], posts: [], forumName: "forum_number_"+i.toString(), forumDesc: "", forumCreateTime: DateTime.now(), profileImage: defaultProfilePicture, headerImage: defaultBackground),
  ];

  late List<PostModel> feedPosts=[];


  void sortFeed(){
    feedPosts.sort((a,b) => b.publishTime.compareTo(a.publishTime));
  }

  void updateFeed(){
    List<PostModel> newFeedPosts=[];
    for(ForumModel forum in currentUser.followedForums){
      newFeedPosts.addAll(forum.posts);
    }
    feedPosts=newFeedPosts;
    sortFeed();
  }

  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

}