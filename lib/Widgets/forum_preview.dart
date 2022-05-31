import '../libs.dart';

class ForumPreview extends StatefulWidget {
  ForumModel forum;
  var pageSetStateFunc;
  ForumPreview({Key? key, required this.forum, this.pageSetStateFunc}) : super(key: key);

  @override
  State<ForumPreview> createState() => _ForumPreviewState();
}

class _ForumPreviewState extends State<ForumPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 30,
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingleForumPage(forum: widget.forum, pageSetState: ()=>setState((){}), )),
              );
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: widget.forum.profileImage.image,
                radius: 17,
              ),
              SizedBox(width: 10,),
              Text(
                "r/" + widget.forum.forumName,
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.pageSetStateFunc();
                    if(Datas().currentUser.starredForums.contains(widget.forum)){
                      Datas().currentUser.starredForums.remove(widget.forum);
                    }else{
                      Datas().currentUser.starredForums.add(widget.forum);
                    }
                  });
                },
                icon: Datas().currentUser.starredForums.contains(widget.forum) ? Icon(Icons.star_rate_rounded, color: Colors.yellow[900], size: 25,):Icon(Icons.star_outline_rounded, color: Colors.grey[800], size: 25,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}