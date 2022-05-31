import '../libs.dart';

class PostDetails extends StatefulWidget {
  PostModel post;
  PostDetails({required this.post ,Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  late final AnimationController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  PreferredSizeWidget? _getAppbar() {
    return SlidingAppBar(
        controller: _controller,
        visible: true,
        child: PostAppBar(() => openDrawer , () => openEndDrawer, widget.post)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: _getAppbar(),
      endDrawer: EndDrawer(),
      body: SingleChildScrollView(
            child: Column(
              children: [
                PostItemInDetails(post: widget.post),
                Container(
                  // margin: EdgeInsets.only(bottom: 5),
                  height: 40,
                  child: PopupMenuButton(
                    itemBuilder: (context)=>[
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.rocket_launch_outlined, size: 20,
                              // color: Colors.grey[600],
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'BEST COMMENTS',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                // color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )
                      ),
                      PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(Icons.new_releases_outlined, size: 20, color: Colors.grey[600],),
                              SizedBox(width: 5,),
                              Text(
                                'NEWEST COMMENTS',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                    child: Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.rocket_launch_rounded, size: 20, color: Colors.grey[600],),
                        SizedBox(width: 5,),
                        Text(
                          'BEST COMMENTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.keyboard_arrow_down_rounded, size: 15, color: Colors.grey[600],),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                CommentSection(post: widget.post),
                SizedBox(height: 200,),
              ],
            ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 2,
                      offset: Offset(0.0, 0.75)
                  )
                ],
              ),
              child: Expanded(
                child: Container(
                  color: Colors.white,
                  child: Expanded(
                    child: Container(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                        margin: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[50],
                        ),
                        child: Text(
                          "Add a comment",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
