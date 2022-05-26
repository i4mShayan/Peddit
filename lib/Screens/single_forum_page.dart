import 'package:peddit/libs.dart';

class SingleForumPage extends StatefulWidget {
  // const singleForumPage({Key? key}) : super(key: key);

  @override
  State<SingleForumPage> createState() => _SingleForumPageState();

}

class _SingleForumPageState extends State<SingleForumPage> {
  ForumModel _forum = ForumModel(UserModel("TestUser", "pm@oamsdka.com", [], [], [] , [] , [] , [] , [] , [] , Image.asset('assets/images/logo/google.png')), [], [], [], "Testforum", "forumDesc" , DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SingleForumPageSliverAppbar(_forum),
          //Sliver List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
