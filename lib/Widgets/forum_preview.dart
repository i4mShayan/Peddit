import '../libs.dart';

class ForumPreview extends StatefulWidget {
  ForumModel currentForum;
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
                  backgroundImage: widget.currentForum.profileImage.image,
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
                      if(Datas().currentUser.starredForums.contains(widget.currentForum)){
                        Datas().currentUser.starredForums.remove(widget.currentForum);
                      }else{
                        Datas().currentUser.starredForums.add(widget.currentForum);
                      }
                    });
                  },
                  icon: Datas().currentUser.starredForums.contains(widget.currentForum) ? Icon(Icons.star_rate_rounded, color: Colors.yellow[900], size: 25,):Icon(Icons.star_outline_rounded, color: Colors.grey[800], size: 25,),
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