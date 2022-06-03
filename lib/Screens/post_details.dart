import '../libs.dart';

enum SortType{
  best, newest
}

class PostDetails extends StatefulWidget {
  PostModel post;
  PostDetails({required this.post ,Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> with SingleTickerProviderStateMixin{

  SortType sortType=SortType.best;

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
        child: PostAppBar(() => openDrawer , () => openEndDrawer, widget.post, ()=>setState((){}))
    );
  }


  final ScrollController _scrollController=ScrollController();
  void _scrollDown() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: _getAppbar(),
      endDrawer: EndDrawer(pageSetState: ()=>setState((){}),),
      body: ListView(
        controller: _scrollController,
          children: [
            PostItemInDetails(post: widget.post),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 40,
              child: PopupMenuButton(
                itemBuilder: (context)=>[
                  PopupMenuItem(
                    onTap: (){
                      setState((){
                        sortType=SortType.best;
                      });
                    },
                    child: sortType==SortType.best ? Row(
                      children: [
                        Icon(Icons.rocket_launch_rounded, size: 20),
                        SizedBox(width: 5,),
                        Text(
                          'BEST COMMENTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                        :
                    Row(
                      children: [
                        Icon(Icons.rocket_launch_outlined, size: 20, color: Colors.grey[600],),
                        SizedBox(width: 5,),
                        Text(
                          'BEST COMMENTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    )
                  ),
                  PopupMenuItem(
                      onTap: (){
                        setState((){
                          sortType=SortType.newest;
                        });
                      },
                    child: sortType==SortType.best ? Row(
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
                        :
                    Row(
                      children: [
                        Icon(Icons.new_releases_rounded, size: 20,),
                        SizedBox(width: 5,),
                        Text(
                          'NEWEST COMMENTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ),
                ],
                child: sortType==SortType.best ?
                Row(
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
                )
                    :
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(Icons.new_releases_rounded, size: 20, color: Colors.grey[600],),
                    SizedBox(width: 5,),
                    Text(
                      'NEWEST COMMENTS',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 5,),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 15, color: Colors.grey[600],),
                  ],
                )
              ),
            ),
            SizedBox(height: 5,),
            CommentSection(post: widget.post),
            SizedBox(height: 200,),
          ],
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                            margin: EdgeInsets.only(left: 10, right: 0, top: 7, bottom: 10),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Material(child: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_double_arrow_down_rounded))),
                      ),
                    ],
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
