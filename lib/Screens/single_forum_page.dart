import 'dart:ui';

import '../libs.dart';

class SingleForumPage extends StatefulWidget {
  var pageSetState;
  ForumModel forum;
  SingleForumPage({required this.forum, required this.pageSetState,Key? key}) : super(key: key);


  @override
  State<SingleForumPage> createState() => _SingleForumPageState();
}

class _SingleForumPageState extends State<SingleForumPage> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState((){});
  }

  String memberCountText(){
    String ans=widget.forum.members.length.toString() + " ";
    if(widget.forum.members.length<=1) ans+="member";
    else ans+="members";
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.blueGrey[50],
      endDrawer: EndDrawer(pageSetState: ()=>setState((){}),),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              bottom: TabBar(
                  indicatorColor: provider.isDarkMode ? Colors.white:Colors.black,
                  labelPadding: const EdgeInsets.all(10),
                  controller: _tabController,
                  tabs: [
                    Text("Posts", style: TextStyle(color: provider.isDarkMode ? Colors.white:Colors.black,),),
                    Text("About", style: TextStyle(color: provider.isDarkMode ? Colors.white:Colors.black,),),
                  ]),
              // backgroundColor: Colors.white,
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 260,
              elevation: 5,
              // forceElevated: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Image(image: widget.forum.headerImage.image,).image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), //blur header using this
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       // boxShadow: <BoxShadow>[
                        //       //   BoxShadow(
                        //       //       color: Colors.black54,
                        //       //       blurRadius: 20.0,
                        //       //       offset: Offset(0.0, -6)
                        //       //   )
                        //       // ],
                        //   ),
                        //   height: 5,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35, left: 22, right: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 0),
                                    child: Text("r/" + widget.forum.forumName,
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.w500)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(memberCountText(),
                                        style: TextStyle(
                                            fontSize: 17, fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                              (userAdminOf(Datas().currentUser, widget.forum) ?
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState((){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditForumPage(forum: widget.forum),
                                        ),
                                      ).then((value) => setState(() {}));
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(color: Colors.blueAccent),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                  ),
                                  label: Text("Edit", style: TextStyle(color: Colors.blueAccent),),
                                  icon: Icon(Icons.edit_rounded),
                                ),
                              )
                                  :
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: TextButton(
                                    onPressed: () {
                                      setState((){
                                        if(userMemberOf(Datas().currentUser, widget.forum)){
                                          widget.forum.members.remove(Datas().currentUser);
                                        }
                                        else{
                                          widget.forum.members.add(Datas().currentUser);
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: userMemberOf(Datas().currentUser, widget.forum) ? Colors.transparent:Colors.blueAccent,
                                      onPrimary: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(color: Colors.blueAccent),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                    ),
                                    child: userMemberOf(Datas().currentUser, widget.forum) ? Text("Joined", style: TextStyle(color: Colors.blueAccent),):Text("Join", style: TextStyle(color: Colors.white),),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),

                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Container(
                        //     height: 100,
                        //     margin: EdgeInsets.only(top: 5, left: 20 , right: 10,),
                        //     child: NotificationListener<OverscrollIndicatorNotification>(
                        //       onNotification: (overScroll) {
                        //         overScroll.disallowIndicator();
                        //         return true;
                        //       },
                        //       child: SizedBox(),
                        //       // child: Scrollbar(
                        //       //   child: SingleChildScrollView(
                        //       //       scrollDirection: Axis.vertical,
                        //       //     child: Text(widget.forum.forumDesc,
                        //       //         style: TextStyle(
                        //       //             fontSize: 15,)),
                        //       //   ),
                        //       // ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all( Radius.circular(100)),
                        border: Border.all(
                        color: Colors.grey.shade300,
                        width: 5,
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.7),
                        //     spreadRadius: 2,
                        //     blurRadius: 30,
                        //     offset: Offset(0, 5), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      margin: EdgeInsets.only(top: 100, left: 12),
                      child: CircleAvatar(
                        backgroundImage: widget.forum.profileImage.image,
                        backgroundColor: Colors.white,
                        radius: 35,
                      ),
                    ),
                  ],
                ),
              ),
              leading: Container(
                margin: const EdgeInsets.only(left: 5, top: 3),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 35,
                    color: Colors.grey[700],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              title: GestureDetector(
                onTap: () => showSearch(
                  context: context,
                  delegate: FeedSearchDelegate(),
                ),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[500],
                        ),
                      ),
                      Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[300]!.withOpacity(0.9),
                  ),
                  // margin: EdgeInsets.only(top: 5),
                  height: 40,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => openEndDrawer(),
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    padding: EdgeInsets.all(7),
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CircleAvatar(
                          backgroundImage: Datas().currentUser.userProfileImage.image,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            ForumPostsList(forum: widget.forum),
            ForumInfo(forum: widget.forum),
          ],
        ),
      ),
    );
  }
}
