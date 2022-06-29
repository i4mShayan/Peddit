import 'package:line_icons/line_icons.dart';

import '../libs.dart';
import 'dart:math' as math;

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
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return AppBar(
      elevation: 1,
      leadingWidth: 70,
      leading: Container(
        margin: const EdgeInsets.only(left: 0, top: 0),
        child: IconButton(
          icon: Icon(
            // Icons.menu_rounded,
            LineIcons.bars,
            size: 33,
            color: provider.isDarkMode ? Colors.grey[500]:Colors.grey[600],
          ),
          onPressed: widget._openDrawer(),
        ),
      ),
      titleSpacing: 5,
      title: GestureDetector(
        onTap: () => showSearch(
            context: context,
            delegate: (Datas().navigationSelectedIndex==1 ?
              ForumSearchDelegate(forums: Datas().forumsList)
                :
              (
                Datas().navigationSelectedIndex==3 ?
                PostSearchDelegate(posts: Datas().currentUser.savedPosts)
                    :
                PostSearchDelegate(posts: Datas().feedPosts)
              )
            ),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: provider.isDarkMode? Colors.grey[800]:Colors.blueGrey[50],

          ),
          child: Row(
            children: [
              SizedBox(width: 7,),
              Container(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(
                    // Icons.search,
                    LineIcons.search,
                    color: provider.isDarkMode? Colors.grey[600]:Colors.grey[400],
                    size: 22,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(
                "Search",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: provider.isDarkMode? Colors.grey[600]:Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: widget._openEndDrawer(),
          child: Container(
            margin: const EdgeInsets.only(right: 15, top: 0, left: 8),
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