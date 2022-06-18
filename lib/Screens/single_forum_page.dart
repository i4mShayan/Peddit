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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey[50],
      endDrawer: EndDrawer(pageSetState: ()=>setState((){}),),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              bottom: TabBar(
                  indicatorColor: Colors.black,
                  labelPadding: const EdgeInsets.all(10),
                  controller: _tabController,
                  tabs: [
                    Text("Posts", style: TextStyle(color: Colors.black),),
                    Text("About", style: TextStyle(color: Colors.black)),
                  ]),
              backgroundColor: Colors.white,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              child: Text("r/" + widget.forum.forumName,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 20 , right: 20),
                              padding: EdgeInsets.only(top: 2 , bottom: 2 , right: 10 , left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 5), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.deepOrange,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Text("Join" , style: TextStyle(color: Colors.deepOrange , fontSize: 20),),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 2, left: 20),
                            child: Text(widget.forum.members.length.toString() + " Memebers",
                                style: TextStyle(
                                    fontSize: 15)),
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
                        borderRadius: BorderRadius.all( Radius.circular(40.0)),
                        // border: Border.all(
                        // color: Colors.grey,
                        // width: 4.0,
                        // ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 20.0,
                              offset: Offset(0.0, 5)
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(top: 100, left: 20),
                      child: CircleAvatar(
                        backgroundImage: widget.forum.profileImage.image,
                        backgroundColor: Colors.white,
                        radius: 30,
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
