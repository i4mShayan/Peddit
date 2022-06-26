import '../libs.dart';

class ForumsPage extends StatefulWidget {
  const ForumsPage({Key? key}) : super(key: key);

  @override
  State<ForumsPage> createState() => _ForumsPageState();
}

class _ForumsPageState extends State<ForumsPage> {

  Future<void> _onRefresh() async {
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return RefreshIndicator(
      color: provider.isDarkMode ? Colors.white:Colors.black,
      onRefresh: _onRefresh,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              "Favorite forums",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          (Datas().currentUser.starredForums.length!=0 ? Column(
            children: [
              ForumsList(forums: Datas().currentUser.starredForums, pageSetState: () => setState((){}),),
            ],
          )
              :
          Column(
            children: [
              Icon(Icons.star_rate_rounded, color: Colors.grey[600]!.withOpacity(0.5), size: 50,),
              Text("Star a forum to show here!",
              style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey[600],)
              ),
            ],
          )
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, bottom: 10),
            child: Text(
              "Followed forums",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          (Datas().currentUser.followedForums.length!=0 ? Column(
            children: [
              ForumsList(forums: Datas().currentUser.followedForums, pageSetState: () => setState((){}),),
            ],
          )
              :
          Column(
            children: [
              Icon(Icons.question_answer_rounded, color: Colors.grey[600]!.withOpacity(0.5), size: 50,),
              Text("Follow a forum to show here!",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.grey[600],)),
            ],
          )
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}