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
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.red, Colors.orange]),
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
      title: Row(
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