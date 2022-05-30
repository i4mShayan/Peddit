import '../libs.dart';

class SingleForumPage extends StatefulWidget {
  SingleForumPage({required this.forum ,Key? key}) : super(key: key);

  ForumModel forum;
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
      endDrawer: EndDrawer(),
      backgroundColor: Colors.grey[300],
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
                    return PostItem(post: Datas().feedPosts[index]);
              },
              childCount: Datas().feedPosts.length,
            ),
          ),
        ],
      ),
    );
  }
}
