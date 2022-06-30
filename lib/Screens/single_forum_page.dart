import 'dart:ui';
import 'dart:math' as math;
import 'package:line_icons/line_icons.dart';

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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
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
                                    child: Text(memberCountTextOf(widget.forum),
                                        style: TextStyle(
                                            fontSize: 17, fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                              (userAdminOf(CurrentUser().user, widget.forum) ?
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7, right: 0),
                                child: TextButton.icon(
                                  onPressed: () {
                                    setState((){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AdminPanel(forum: widget.forum),
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
                                  label: Text("Admin Panel", style: TextStyle(color: Colors.blueAccent),),
                                  icon: Transform.rotate(
                                    angle: 90 * math.pi / 180,
                                    child: Icon(Icons.build_rounded),
                                  )
                                ),
                              )
                                  :
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7, right: 0),
                                  child: TextButton(
                                    onPressed: () {
                                      setState((){
                                        if(userMemberOf(CurrentUser().user, widget.forum)){
                                          widget.forum.members.remove(CurrentUser().user);
                                          CurrentUser().user.followedForums.remove(widget.forum);
                                        }
                                        else{
                                          widget.forum.members.add(CurrentUser().user);
                                          CurrentUser().user.followedForums.add(widget.forum);
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: userMemberOf(CurrentUser().user, widget.forum) ? Colors.transparent:Colors.blueAccent,
                                      onPrimary: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(color: Colors.blueAccent),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                                    ),
                                    child: userMemberOf(CurrentUser().user, widget.forum) ? Text("Joined", style: TextStyle(color: Colors.blueAccent),):Text("Join", style: TextStyle(color: Colors.white),),
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
                margin: const EdgeInsets.only(left: 7, top: 3),
                child: IconButton(
                  icon: Icon(
                    // Icons.arrow_back_rounded,
                    LineIcons.arrowLeft,
                    size: 35,
                    color: provider.isDarkMode ? Colors.grey[700]:Colors.grey[600],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              title: GestureDetector(
                onTap: () => showSearch(
                  context: context,
                  delegate: PostSearchDelegate(posts: widget.forum.posts),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: provider.isDarkMode? Colors.grey[800]!.withOpacity(0.95):Colors.blueGrey[50]!.withOpacity(0.95),

                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 7,),
                      Container(
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Icon(
                            // Icons.search,
                            LineIcons.search,
                            color: provider.isDarkMode? Colors.grey[600]:Colors.grey[400],
                            size: 22,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: provider.isDarkMode? Colors.grey[600]:Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
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
                          backgroundImage: CurrentUser().user.userProfileImage.image,
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
