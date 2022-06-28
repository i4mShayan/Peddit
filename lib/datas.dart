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

  late List<UserModel> usersList=[currentUser];

  late List<ForumModel> forumsList=[
    ForumModel(owner: currentUser, admins: [], members: [], blockedUsers: [], posts: [], forumName: "name", forumDesc: "", forumCreateTime: DateTime.now(), profileImage: defaultProfilePicture, headerImage: defaultBackground)
  ];

  late List<PostModel> feedPosts=[
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
    PostModel(title: "test", desc: "test", publisher: currentUser, forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
  ];


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