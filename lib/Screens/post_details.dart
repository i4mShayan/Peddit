import '../libs.dart';

class PostDetails extends StatefulWidget {
  PostModel post;
  PostDetails({required this.post ,Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> with SingleTickerProviderStateMixin{

  SortType _sortType=SortType.best;

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

  Future<void> _onRefresh() async {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: _getAppbar(),
      endDrawer: EndDrawer(pageSetState: ()=>setState((){}),),
      body: RefreshIndicator(
        color: provider.isDarkMode ? Colors.white:Colors.black,
        onRefresh: _onRefresh,
        child: ListView(
          shrinkWrap: true,
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
                          _sortType=SortType.best;
                        });
                      },
                      child: _sortType==SortType.best ? Row(
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
                          Icon(Icons.rocket_launch_outlined, size: 20,
                            color: Colors.grey[600],
                          ),
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
                            _sortType=SortType.newest;
                          });
                        },
                      child: _sortType==SortType.best ? Row(
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
                  child: _sortType==SortType.best ?
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
              CommentSection(post: widget.post, sortType: _sortType,),
              SizedBox(height: 60,),
            ],
            ),
      ),
      bottomSheet: Positioned(
        child: Container(
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
                    color: provider.isDarkMode ? Colors.grey[900]:Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                              margin: EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: provider.isDarkMode ? Colors.grey[800]:Colors.blueGrey[50],
                              ),
                              child: InkWell(
                                onTap: (){
                                  if(widget.post.forum.blockedUsers.contains(Datas().currentUser)){
                                    showDialogWith(context: context, title: "Your are blocked :(", content: "You can't make posts/comments in this forum!");
                                  }
                                  else {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            AddNewCommentPage(
                                              pageSetState: () =>
                                                  setState(() {}),
                                              replyingPost: widget.post,)
                                    ));
                                  }
                                },
                                child: Text(
                                  "Add a comment",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: provider.isDarkMode ? Colors.grey[400]:Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Material(
                            color: Colors.transparent,
                              child: IconButton(onPressed: (){
                            _scrollController.animateTo(
                              0.0,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          }, icon: Icon(Icons.keyboard_double_arrow_up_rounded,),)),
                        ),
                      ],
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
