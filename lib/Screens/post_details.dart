import 'package:peddit/libs.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 5 , top: 3),
            child: IconButton(
              icon: Icon(
                Icons.menu_rounded,
                size: 35,
                color: Colors.grey[700],
              ),
              onPressed: () {},
            ),
          ),
          title: Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5 , right: 5),
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
            width: 250,
            height: 40,
          ),
          backgroundColor: Colors.white,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
              ),
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: Text("Hello"),
      ),
    );
  }
}
