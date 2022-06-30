import '../libs.dart';

class PostAppBar extends StatefulWidget implements PreferredSizeWidget{
  // const mainAppBar({Key? key}) : super(key: key);
  Function _openDrawer;
  Function _openEndDrawer;
  PostModel post;
  var pageSetState;
  PostAppBar(this._openDrawer, this._openEndDrawer, this.post, this.pageSetState);

  @override
  State<PostAppBar> createState() => _PostAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _PostAppBarState extends State<PostAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: (provider.isDarkMode ? [Color(0xff374ABE), Colors.blue]:[Colors.red, Colors.orange]),
          ),
        ),
      ),
      elevation: 1,
      leading: Container(
        margin: const EdgeInsets.only(left: 5, top: 3),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 35,
            color: Colors.grey[250],
          ),
          onPressed: (){Navigator.of(context).pop();},
        ),
      ),
      title: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingleForumPage(forum: widget.post.forum, pageSetState: widget.pageSetState,)),
          ).then(widget.pageSetState());
        },
        child: Row(
          children: [
            Text(
              "r/",
              style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w400,),
            ),
            Text(
              widget.post.forum.forumName,
              style: TextStyle(color: Colors.grey[250], fontWeight: FontWeight.w500,),
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: widget._openEndDrawer(),
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
    );
  }
}