import '/libs.dart';

class SingleForumPageSliverAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  // const singleForumPageSliverAppbar({Key? key}) : super(key: key);

  ForumModel _forum;

  SingleForumPageSliverAppbar(this._forum);
  @override
  State<SingleForumPageSliverAppbar> createState() =>
      _SingleForumPageSliverAppbarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _SingleForumPageSliverAppbarState
    extends State<SingleForumPageSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: 300,
      elevation: 5,
      forceElevated: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.orangeAccent,
                  child: Image.asset(
                    'assets/images/logo/google.png',
                    cacheHeight: 100,
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
                      child: Text("r/" + widget._forum.forumName,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
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
                    child: Text(widget._forum.members.length.toString() + " Memebers",
                        style: TextStyle(
                            fontSize: 15)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Text(widget._forum.forumDesc,
                        style: TextStyle(
                            fontSize: 20,)),
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
          onPressed: () {},
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
                  color: Colors.grey[700],
                ),
              ),
              Text(
                "Search",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.54),
          ),
          // margin: EdgeInsets.only(top: 5),
          width: 250,
          height: 40,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
            ),
          ),
        ),
      ],
    );
  }
}
