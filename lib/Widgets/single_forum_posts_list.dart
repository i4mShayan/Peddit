import '../libs.dart';

class ForumPostsList extends StatefulWidget {
  ForumModel forum;
  ForumPostsList({Key? key, required this.forum}) : super(key: key);

  @override
  State<ForumPostsList> createState() => _ForumPostsListState();
}

class _ForumPostsListState extends State<ForumPostsList> {

  Future<void> _onRefresh() async {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return  RefreshIndicator(
        color: provider.isDarkMode ? Colors.white:Colors.black,
        onRefresh: _onRefresh,
        child : (widget.forum.posts.length !=0 ? ListView.builder(
          itemCount: widget.forum.posts.length,
          itemBuilder: (context, i){
            return PostItem(post: widget.forum.posts[i], pageSetState: ()=>setState((){}), inForumPage: true,);
          }
        ):
    ListView(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height -    // total height
                kToolbarHeight -                      // top AppBar height
                MediaQuery.of(context).padding.top -  // top padding
                MediaQuery.of(context).padding.bottom - // bottom padding
                kBottomNavigationBarHeight)/2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/gifs/empty_feed.gif", scale: 4,),
                  Text("such empty!", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Colors.grey[600],
                  ),),
                ],
              ),
            ),
          ),
        ]
    )
        )
    );
  }
}
