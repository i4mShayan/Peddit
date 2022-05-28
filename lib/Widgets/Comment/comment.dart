import '../../libs.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
