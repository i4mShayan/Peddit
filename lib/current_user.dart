import 'libs.dart';


part 'current_user.g.dart';


@JsonSerializable(explicitToJson: true)
class CurrentUser{
  late UserModel user;
  // =UserModel(userName: "username", email: "email@site.com", userProfileImage: Datas().defaultProfilePicture,
  //     followedForums: [], starredForums: [], savedPosts: [], password: 'Aaaa1234', commentsCount: 0, userPostsCount: 0);
  CurrentUser._();

  static final CurrentUser _instance = CurrentUser._();

  factory CurrentUser() {
    return _instance;
  }


  Future<void> updateUser() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("@${user.userName}/ProfilePage#\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        print("$responseString");
        if (responseString == "UserDidNotfound") {
          print(responseString);
        }
        else {
          user = UserModel.fromJson(jsonDecode(responseString));
        }
      });
      socket.close();
    });
  }


  factory CurrentUser.fromJson(Map<String, dynamic> json) => _$CurrentUserFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentUserToJson(this);
}