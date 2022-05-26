import '../libs.dart';

class PostItem extends StatefulWidget {
  final PostModel post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: (Material(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: const CircleAvatar(
                    radius: 20,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "r/" + widget.post.forum.forumName,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "u/" + widget.post.usr.userName,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text('.'),
                          Text(DateTime.now()
                                  .difference(widget.post.time)
                                  .inHours
                                  .toString() +
                              "h"),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  child: Text(
                    widget.post.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 20, bottom: 10, right: 20),
                    child: Text(widget.post.desc))),
            Container(
              child: Image.asset('assets/images/logo/google.png', cacheHeight: 250),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_upward_rounded)),
                    Text("Vote"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_downward_rounded)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mode_comment_outlined)),
                    Text(/*post.comments.length.toString()*/ "0"),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.bookmark_border)),
                      Text("Save"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
