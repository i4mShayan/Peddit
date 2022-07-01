import 'package:reddit_project/datas_model.dart';

import 'libs.dart';


part 'datas.g.dart';


@JsonSerializable(explicitToJson: true)
class Datas{

  late List<ForumModel> forumsList;


  Datas._();

  static final Datas _instance = Datas._();

  factory Datas() {
    return _instance;
  }

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);
  Map<String, dynamic> toJson() => _$DatasToJson(this);



  Future<void> getDatas() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("/GetDatas#\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        forumsList = Datas.fromJson(jsonDecode(responseString)).forumsList;
      });
      socket.close();
    });
  }

  Future<void> sendDatas() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("/SendDatas#"+ jsonEncode(DatasModel(forumsList: Datas().forumsList).toJson()) +"\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        if(responseString=="DatasUpdated"){
          print("DatasUpdated");
        }
        else{
          print("problem in updating datas");
        }
      });
      socket.close();
    });
  }

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