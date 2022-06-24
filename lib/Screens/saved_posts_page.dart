import '../libs.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({Key? key}) : super(key: key);

  @override
  State<SavedPostsPage> createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {


  Future<void> _onRefresh() async {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[50],
      resizeToAvoidBottomInset: false,
      body:
        RefreshIndicator(
          color: Colors.black54,
          onRefresh: _onRefresh,
          child: Datas().currentUser.savedPosts.isNotEmpty ? ListView.builder(
              itemCount: Datas().currentUser.savedPosts.length,
              itemBuilder: (contex, index) {
                return PostItem(post: Datas().currentUser.savedPosts[index], pageSetState: ()=>setState((){}));
              })
              :
          ListView(
            // shrinkWrap: true,
            children: [
              SizedBox(
              height: (MediaQuery.of(context).size.height -    // total height
                  kToolbarHeight -                      // top AppBar height
                  MediaQuery.of(context).padding.top -  // top padding
                  MediaQuery.of(context).padding.bottom - // bottom padding
                  kBottomNavigationBarHeight)/1.1,            // BottomNavigationBar height
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bookmark_rounded, color: Colors.grey[600]!.withOpacity(0.5), size: 100,),
                    Text("No saved post", style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),),
                  ],
                ),
            ),
              ),
            ]
          )
        ),
    );
  }
}
