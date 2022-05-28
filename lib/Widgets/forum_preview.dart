import '../libs.dart';

class ForumPreview extends StatefulWidget {
  DemoForumModel currentForum;
  ForumPreview({Key? key, required this.currentForum}) : super(key: key);

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
                  widget.currentForum.forumName,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        // if(Datas().currentUser.starredForums.contains(widget.currentForum)){
                        //   Datas().currentUser.starredForums.remove(widget.currentForum);
                        // }else{
                        //   Datas().currentUser.starredForums.add(widget.currentForum);
                        // }
                        widget.currentForum.isStarred=!widget.currentForum.isStarred;
                      });
                    },
                    // icon: Datas().currentUser.starredForums.contains(widget.currentForum) ? Icon(Icons.star, color: Colors.yellow[900], size: 25,):Icon(Icons.star_border, color: Colors.grey[800], size: 25,),
                    icon: widget.currentForum.isStarred ? Icon(Icons.star, color: Colors.yellow[900], size: 25,):Icon(Icons.star_border, color: Colors.grey[800], size: 25,),
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
