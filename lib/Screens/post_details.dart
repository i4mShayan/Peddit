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
      key: _scaffoldKey,
      appBar: _getAppbar(),
      drawer: Drawer(),
      endDrawer: EndDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommentSection(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: CircleAvatar(
                  // radius: 10,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: (value){
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Add a new comment" ,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
