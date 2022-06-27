import 'libs.dart';

class Datas{
  ThemeMode themeMode=ThemeMode.dark;
  bool loggedIn = true;
  late UserModel currentUser=UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
  followedForums: [], starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
      likedComments: [], disLikedComments: [], userPosts: [], comments: [], password: 'Fasda1231');
  PageController pageController=PageController();
  int navigationSelectedIndex=0;
  Image defaultProfilePicture=Image.asset("assets/images/default_profile.png");
  Image defaultBackground=Image.asset("assets/images/default_background.png");

  late List<UserModel> usersList=[currentUser];

  late List<ForumModel> forumsList=[
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
        followedForums: [], starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
        likedComments: [], disLikedComments: [], userPosts: [], comments: [], password: 'Fasda1231'),
        forumCreateTime: DateTime.now(),
        headerImage: Image.network('https://docs.flutter.dev/assets/images/flutter-logo-sharing.png'),
        profileImage: Image.network("https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png"),
        members: [], posts: [], admins: [],
        forumName: "Flutter",
        forumDesc: "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. First described in 2015, Flutter was released in May 2017.", blockedUsers: []),
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
        followedForums: [], starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
        likedComments: [], disLikedComments: [], userPosts: [], comments: [], password: 'Fasda1231'),
        forumCreateTime: DateTime.now(),
        headerImage: Image.network('https://www.karzar.net/uploads/campaigns/2021/12/022812919113_446.jfif.jpg'),
        profileImage: Image.network("https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/zblwhkcto9iqiwjx2ckg"),
        members: [], posts: [], admins: [],
        forumName: "Shahid_Beheshti_Uni",
        forumDesc:  "Shahid Beheshti University is a public university founded in 1959 and one of the top universities in Iran. The university offers a large number of programs at Bachelor's, Master's and Ph.D. levels.", blockedUsers: []
    ),
  ];

  late List<PostModel> feedPosts=[
    PostModel(title: "hi!", desc: "by!", publisher: UserModel(userName: "shayan", email: "shayan@gmail.com", followedForums: [], starredForums: [], comments: [], userPosts: [], upVotedPosts: [], downVotedPosts: [], savedPosts: [], likedComments: [], disLikedComments: [], password: "testpassword", userProfileImage: defaultProfilePicture), forum: forumsList[0], publishTime: DateTime.now(), upVotedUsers: [], downVotedUsers: [], comments: [], commentsCount: 0),
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