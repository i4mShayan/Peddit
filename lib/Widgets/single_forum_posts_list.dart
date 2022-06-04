import '../libs.dart';

class ForumPostsList extends StatefulWidget {
  ForumModel forum;
  ForumPostsList({Key? key, required this.forum}) : super(key: key);

  @override
  State<ForumPostsList> createState() => _ForumPostsListState();
}

class _ForumPostsListState extends State<ForumPostsList> {
  @override
  Widget build(BuildContext context) {
    return (widget.forum.posts.length !=0 ? ListView.builder(
      itemCount: widget.forum.posts.length,
      itemBuilder: (context, i){
        return PostItem(post: widget.forum.posts[i], pageSetState: ()=>setState((){}), inForumPage: true,);
      }
    ):    Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset("assets/gifs/funny_empty_feed.gif", scale: 4,),
    SizedBox(height: 7,),
    Text("such empty!", style: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: Colors.grey[600],
    ),),
    ],
    ),));
  }
}
