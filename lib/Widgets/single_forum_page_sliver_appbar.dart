import 'dart:ui';

import '../libs.dart';

class SingleForumPageSliverAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  SingleForumPageSliverAppbar({required this.openEndDrawer ,required this.forum ,Key? key}) : super(key: key);

  ForumModel forum;
  Function openEndDrawer;

  @override
  State<SingleForumPageSliverAppbar> createState() =>
      _SingleForumPageSliverAppbarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _SingleForumPageSliverAppbarState
    extends State<SingleForumPageSliverAppbar> {

  int maxDescLines=3;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: 320,
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
                  color: Colors.orangeAccent,
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
                Container(
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20.0,
                            offset: Offset(0.0, -6)
                        )
                      ],
                  ),
                  height: 5,
                ),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 5, left: 20 , right: 10,),
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();
                        return true;
                      },
                      child: Scrollbar(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                          child: Text(widget.forum.forumDesc,
                              style: TextStyle(
                                  fontSize: 15,)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( Radius.circular(40.0)),
                border: Border.all(
                  color: Colors.white,
                  width: 4.0,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 35.0,
                      offset: Offset(0.0, 5)
                  )
                ],
              ),
              margin: EdgeInsets.only(top: 105, left: 20),
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
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[300]!.withOpacity(0.9),
          ),
          // margin: EdgeInsets.only(top: 5),
          height: 100
        ),
      ),
      actions: [
        GestureDetector(
          onTap: widget.openEndDrawer(),
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
    );
  }
}
