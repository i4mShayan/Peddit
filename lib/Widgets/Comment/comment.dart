import '../../libs.dart';

class Comment extends StatefulWidget {
  CommentModel comment;
  Comment({required this.comment, Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: const CircleAvatar(
                  radius: 20,
                ),
              ),
              Text(
                "u/" + "widget.post.usr.userName",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.circle , size: 5, color: Colors.grey,),
              ),
              Text(DateTime.now()
                  .difference(DateTime.now())
                  .inHours
                  .toString() +
                  "h", style: TextStyle(fontSize: 15, color: Colors.grey),),
            ],
          ),
        ],
      ),
    );
  }
}
