import '../libs.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget{
  // const mainAppBar({Key? key}) : super(key: key);
  Function _openDrawer;
  Function _openEndDrawer;


  MainAppBar(this._openDrawer, this._openEndDrawer);

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: Container(
        margin: const EdgeInsets.only(left: 5, top: 3),
        child: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 35,
            color: Colors.grey[700],
          ),
          onPressed: widget._openDrawer(),
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
            color: Colors.grey[300],
          ),
          // margin: EdgeInsets.only(top: 5),
          height: 40,
        ),
      ),
      backgroundColor: Colors.white,
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