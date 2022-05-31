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
        forumCreateTime: DateTime.now() , headerImage: Datas().defaultBackground, profileImage: Datas().defaultProfilePicture, members: [], posts: [], admins: [] , forumName: "hello",forumDesc: "forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_forum Desc_"),
  ];

  late List<PostModel> feedPosts=[
    PostModel(title: "title_title_title_title_title_title_title_title_title_", desc: "post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_post decription_",
      publisher: UserModel(userName: "user", email: "email",
          userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
          disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []),
      forum: forumsList[0],
      publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, upVotedUsers: [], downVotedUsers: [] , comments: [
        CommentModel(publisher: UserModel(userName: "user", email: "email",
            userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
            disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []), publishTime: DateTime.now(), commentDesc: "wow nice comment section!", usersReplied: [], upVotedUsers: [], downVotedUsers: []),
          CommentModel(publisher: UserModel(userName: "user", email: "email",
              userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
              disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []), publishTime: DateTime.now(), commentDesc: "wow nice comment section!", usersReplied: [], upVotedUsers: [], downVotedUsers: []),
          CommentModel(publisher: UserModel(userName: "user", email: "email",
              userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
              disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []), publishTime: DateTime.now(), commentDesc: "wow nice comment section!", usersReplied: [], upVotedUsers: [], downVotedUsers: []),
        ]),

    PostModel(title: "title", desc: "dec",
      publisher: UserModel(userName: "user", email: "email",
          userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
          disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []),
      forum: forumsList[0],
      publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, upVotedUsers: [], downVotedUsers: [], comments: []),
  ];

  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

}