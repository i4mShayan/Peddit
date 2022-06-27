import 'libs.dart';

class Datas{
  ThemeMode themeMode=ThemeMode.dark;
  bool loggedIn = false;

  late UserModel currentUser;
  // =UserModel(userName: "username", email: "email@site.com", userProfileImage: Datas().defaultProfilePicture,
  // followedForums: [], starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
  //     likedComments: [], disLikedComments: [], userPosts: [], comments: [], password: 'Aaaa1234');

  PageController pageController=PageController();
  int navigationSelectedIndex=0;
  Image defaultProfilePicture=Image.asset("assets/images/default_profile.png");
  Image defaultBackground=Image.asset("assets/images/default_background.png");

  late List<UserModel> usersList=[currentUser];

  late List<ForumModel> forumsList=[];

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