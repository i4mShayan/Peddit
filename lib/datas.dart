import 'libs.dart';

class Datas{
  PageController pageController=PageController();
  int navigationSelectedIndex=0;
  Image defaultProfilePicture=Image.asset("assets/images/default_profile.png");
  Image defaultBackground=Image.asset("assets/images/default_background.png");
  late UserModel currentUser=UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
  followedForums: forumsList, starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
      likedComments: [], disLikedComments: [], userPosts: [], comments: []);

  late List<UserModel> usersList=[currentUser];

  late List<ForumModel> forumsList=[
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
        followedForums: [], starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
        likedComments: [], disLikedComments: [], userPosts: [], comments: []),
        forumCreateTime: DateTime.now(),
        headerImage: Image.network('https://docs.flutter.dev/assets/images/flutter-logo-sharing.png'),
        profileImage: Image.network("https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png"),
        members: [], posts: [], admins: [],
        forumName: "Flutter",
        forumDesc: "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. First described in 2015, Flutter was released in May 2017."),
    ForumModel(owner: UserModel(userName: "username", email: "email", userProfileImage: Datas().defaultProfilePicture,
        followedForums: [], starredForums: [], downVotedPosts: [], upVotedPosts: [], savedPosts: [],
        likedComments: [], disLikedComments: [], userPosts: [], comments: []),
        forumCreateTime: DateTime.now(),
        headerImage: Image.network('https://www.karzar.net/uploads/campaigns/2021/12/022812919113_446.jfif.jpg'),
        profileImage: Image.network("https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco,dpr_1/zblwhkcto9iqiwjx2ckg"),
        members: [], posts: [], admins: [],
        forumName: "Shahid_Beheshti_University",
        forumDesc:  "Shahid Beheshti University is a public university founded in 1959 and one of the top universities in Iran. The university offers a large number of programs at Bachelor's, Master's and Ph.D. levels."
    ),
  ];

  late List<PostModel> feedPosts=[
    PostModel(title: "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. First described in 2015, Flutter was released in May 2017.",
        desc: "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. First described in 2015, Flutter was released in May 2017.",
      publisher: UserModel(userName: "user", email: "email",
          userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
          disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []),
      forum: forumsList[0],
      publishTime: DateTime.now(), hasImage: true, postImage: Image.network("https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/6078b650748b8558d46ffb7f_Flutter%20app%20development.png"), upVotedUsers: [], downVotedUsers: [] , comments: [
        CommentModel(publisher: UserModel(userName: "SBU", email: "email",
            userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
            disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []), publishTime: DateTime.now(), commentDesc: "wow nice comment section!", usersReplied: [], upVotedUsers: [], downVotedUsers: []),
          CommentModel(publisher: UserModel(userName: "user", email: "email",
              userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
              disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []), publishTime: DateTime.now(), commentDesc: "wow nice comment section!", usersReplied: [], upVotedUsers: [], downVotedUsers: []),
          CommentModel(publisher: UserModel(userName: "user", email: "email",
              userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
              disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []), publishTime: DateTime.now(), commentDesc: "wow nice comment section!", usersReplied: [], upVotedUsers: [], downVotedUsers: []),
        ]),
  ];


  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

}