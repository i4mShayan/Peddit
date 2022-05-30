import '../libs.dart';

class PostAppBar extends StatefulWidget implements PreferredSizeWidget{
  // const mainAppBar({Key? key}) : super(key: key);
  Function _openDrawer;
  Function _openEndDrawer;
  PostModel post;

  PostAppBar(this._openDrawer, this._openEndDrawer, this.post);

  @override
  State<PostAppBar> createState() => _PostAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _PostAppBarState extends State<PostAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orangeAccent,
      elevation: 1,
      leading: Container(
        margin: const EdgeInsets.only(left: 5, top: 3),
        child: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 35,
            color: Colors.grey[800],
          ),
          onPressed: widget._openDrawer(),
        ),
      ),
      title: Row(
        children: [
          Text(
            "r/",
            style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w400,),
          ),
          Text(
            widget.post.forum.forumName,
            style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500,),
          ),
        ],
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
                  backgroundImage: Datas().currentUser.userProfileImage.image,
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