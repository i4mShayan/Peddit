import '../libs.dart';

class SingleForumPage extends StatefulWidget {
  var pageSetState;
  ForumModel forum;
  SingleForumPage({required this.forum, required this.pageSetState,Key? key}) : super(key: key);


  @override
  State<SingleForumPage> createState() => _SingleForumPageState();
}

class _SingleForumPageState extends State<SingleForumPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: EndDrawer(pageSetState: ()=>setState((){}),),
      backgroundColor: Colors.blueGrey[50],
      body: CustomScrollView(
        slivers: <Widget>[
          SingleForumPageSliverAppbar(forum: widget.forum , openEndDrawer:()=> openEndDrawer),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 2,
            ),
          ),
          //Sliver List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return PostItem(post: widget.forum.posts[index], pageSetState: widget.pageSetState, inForumPage: true,);
              },
              childCount: widget.forum.posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
