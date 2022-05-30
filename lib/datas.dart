import 'libs.dart';

class Datas{
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
        forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture, members: [], posts: [], admins: []),
  ];

  late List<PostModel> feedPosts=[
    PostModel(title: "title_title_title_title_title_title_title_title_title_", desc: "dec",
      publisher: UserModel(userName: "user", email: "email",
          userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
          disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []),
      forum: ForumModel(owner: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture,followedForums: [],
        starredForums: [], downVotedPosts: [], disLikedComments: [], userPosts: [], likedComments: [], savedPosts: [], comments: [], upVotedPosts: [], ),
          forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture, posts: [], admins: [], members: []),
      publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, upVotedUsers: [], downVotedUsers: [],),

    PostModel(title: "title", desc: "dec",
      publisher: UserModel(userName: "user", email: "email",
          userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
          disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []),
      forum: ForumModel(owner: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture,followedForums: [],
        starredForums: [], downVotedPosts: [], disLikedComments: [], userPosts: [], likedComments: [], savedPosts: [], comments: [], upVotedPosts: [], ),
          forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture, posts: [], admins: [], members: []),
      publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, upVotedUsers: [], downVotedUsers: [],),
  ];

  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

}