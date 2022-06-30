import 'libs.dart';


part 'datas.g.dart';


@JsonSerializable(explicitToJson: true)
class Datas{

  late List<ForumModel> forumsList;
  late List<PostModel> feedPosts;


  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }


  void sortFeed(){
    feedPosts.sort((a,b) => b.publishTime.compareTo(a.publishTime));
  }

  void updateFeed(){
    List<PostModel> newFeedPosts=[];
    for(ForumModel forum in CurrentUser().user.followedForums){
      newFeedPosts.addAll(forum.posts);
    }
    feedPosts=newFeedPosts;
    sortFeed();
  }


  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);
  Map<String, dynamic> toJson() => _$DatasToJson(this);

  // Future<void> updateCurrentUser() async {
  //   await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
  //     socket.write("@${currentUser.userName}/ProfilePage#\u0000");
  //     socket.flush();
  //     socket.listen((response) {
  //       String responseString = String.fromCharCodes(response);
  //       print("$responseString");
  //       if (responseString == "UserDidNotfound") {
  //         print(responseString);
  //       }
  //       else {
  //         currentUser = UserModel.fromJson(jsonDecode(responseString));
  //       }
  //     });
  //     socket.close();
  //   });
  // }
  //
  // Future<void> updatePostsList() async {
  //   await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
  //     socket.write("@${CurrentUser().user.userName}/FeedPagePosts#\u0000");
  //     socket.flush();
  //     socket.listen((response) {
  //       print(response.toString());
  //       String responseString = String.fromCharCodes(response);
  //       print("Recieved response: $responseString");
  //       if(responseString == "UserDidNotfound") {
  //         print(responseString);
  //       }
  //       else {
  //         postsFromServer = FeedPagePostsForCurrentUser.fromJson(jsonDecode(responseString));
  //         posts=postsFromServer.posts;
  //       }
  //     });
  //     socket.close();
  //   });
  // }

  // Future<void> addPostRequest(PostModel post) async {
  //   await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
  //     socket.write("/AddPost#" + post.toJson().toString() + "\u0000");
  //     print(post.toJson().toString());
  //     socket.flush();
  //     print("AddPost request sent!");
  //     socket.close();
  //   });
  // }
}