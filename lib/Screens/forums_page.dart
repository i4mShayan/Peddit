import 'dart:convert';
import 'dart:io';

import 'package:reddit_project/Models/forum_list_model.dart';

import '../libs.dart';

class ForumsPage extends StatefulWidget {
  const ForumsPage({Key? key}) : super(key: key);

  @override
  State<ForumsPage> createState() => _ForumsPageState();
}

class _ForumsPageState extends State<ForumsPage> {

  List<ForumModel> allForums = [];
  List<ForumModel> followedForums = [];
  List<ForumModel> staredForums = [];

  late List<Map<String, dynamic>> _items;

  @override
  void initState() {
    _items = [
      {
        'icon': Icons.star_rounded,
        'title': "Favorites",
        'list': staredForums,
        'isExpanded': true,
        'empty_list_message': "Star a forum to show here!",
        'empty_list_icon': Icons.star_rate_rounded,
      },
      {
        'icon': Icons.group_rounded,
        'title': "Followed Forums",
        'list': followedForums,
        'isExpanded': true,
        'empty_list_message': "Follow/create a forum to show here!",
        'empty_list_icon': Icons.group_rounded,
      },
      {
        'icon': Icons.groups_rounded,
        'title': "All Forums",
        'list': allForums,
        'isExpanded': false,
        'empty_list_message': "Be the first one who creates a forum!",
        'empty_list_icon': Icons.group_add_rounded,
      },
    ];
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState((){
      updateAllForumsList();
      updateFollowedForumsList();
      updateStaredForumsList();
    });
  }

  Future<void> updateAllForumsList() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("@${Datas().currentUser.userName}/AllForumsList#\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        print("$responseString");
        if(responseString == "UserDidNotfound") {
          print(responseString);
        }
        else {
          setState((){
            allForums = ForumListModel.fromJson(jsonDecode(responseString)).forums;
          });
        }
      });
      socket.close();
    });
  }

  Future<void> updateFollowedForumsList() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("@${Datas().currentUser.userName}/FollowedForumsList#\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        print("$responseString");
        if(responseString == "UserDidNotfound") {
          print(responseString);
        }
        else {
          setState((){
            followedForums = ForumListModel.fromJson(jsonDecode(responseString)).forums;
          });
        }
      });
      socket.close();
    });
  }

  Future<void> updateStaredForumsList() async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("@${Datas().currentUser.userName}/StarredForumsList#\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        print("$responseString");
        if(responseString == "UserDidNotfound") {
          print(responseString);
        }
        else {
          setState((){
            staredForums = ForumListModel.fromJson(jsonDecode(responseString)).forums;
          });
        }
      });
      socket.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return RefreshIndicator(
      color: provider.isDarkMode ? Colors.white:Colors.black,
      onRefresh: _onRefresh,
      child: Scaffold(
        body: ListView(
          children: [
            // SizedBox(height: 1,),
            ExpansionPanelList(
              // dividerColor: Colors.transparent,
              elevation: 0,
              animationDuration: Duration(milliseconds: 500),
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _items[index]['isExpanded'] = !isExpanded;
                });
              },
              children: [
                for(dynamic item in _items)
                  ExpansionPanel(
                    // backgroundColor: Theme.of(context).cardColor,
                    isExpanded: item['isExpanded'],
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext, isExpanded)=>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(item['icon'], size: 20,),
                            SizedBox(width: 10,),
                            Text(
                              item['title'],
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Verdana',),
                            ),
                          ],
                        ),
                      ),
                    body:
                        Container(
                          padding: EdgeInsets.only(top: 0, bottom: 15),
                          // color: Theme.of(context).scaffoldBackgroundColor,
                          child: (item['list'].length!=0 ?
                          ForumsList(forums: item['list'], pageSetState: () => setState((){}),)
                              :
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(item['empty_list_icon'], color: Colors.grey[600]!.withOpacity(0.5), size: 50,),
                                Center(
                                  child: Text(item['empty_list_message'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Colors.grey[600],)
                                  ),
                                ),
                              ],
                            ),
                          )
                          ),
                        )
                  ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}