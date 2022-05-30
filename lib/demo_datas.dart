import 'libs.dart';

List<PostModel> feedPosts=[
  PostModel(title: "title", desc: "dec",
    publisher: UserModel(userName: "user", email: "email",
        userProfileImage: Datas().defaultProfilePicture, followedForums: [], starredForums: [], upVotedPosts: [], userPosts: [],
        disLikedComments: [], comments: [], downVotedPosts: [], savedPosts: [], likedComments: []),

    forum: ForumModel(owner: UserModel(userName: "user", email: "email", userProfileImage: Datas().defaultProfilePicture,followedForums: [],
      starredForums: [], downVotedPosts: [], disLikedComments: [], userPosts: [], likedComments: [], savedPosts: [], comments: [], upVotedPosts: [], ),
        forumCreateTime: DateTime.now(), profileImage: Datas().defaultProfilePicture, posts: [], admins: [], members: []),
    publishTime: DateTime.now(), hasImage: true, postImage: Datas().defaultBackground, upVotedUsers: [], downVotedUsers: [],),
];