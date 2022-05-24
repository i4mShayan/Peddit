import 'package:peddit/libs.dart';

class ForumPreview extends StatefulWidget {
  Forum forum;
  ForumPreview({Key? key, required this.forum}) : super(key: key);

  @override
  State<ForumPreview> createState() => _ForumPreviewState();
}

class _ForumPreviewState extends State<ForumPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              widget.forum.moveTo(0);
            });
          },
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 20,
                ),
                SizedBox(width: 10,),
                Text(
                  "r/",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  widget.forum.name,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.forum.isStarred=!widget.forum.isStarred;
                      });
                    },
                    icon: widget.forum.isStarred ? Icon(Icons.star, color: Colors.yellow[900], size: 25,):Icon(Icons.star_border, color: Colors.grey[800], size: 25,),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 1,),
      ],
    );
  }
}
