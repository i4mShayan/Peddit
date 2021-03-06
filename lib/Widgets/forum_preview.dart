import '../libs.dart';

class ForumPreview extends StatefulWidget {
  ForumModel forum;
  var pageSetStateFunc;
  bool showStar;
  ForumPreview({Key? key, required this.forum, this.pageSetStateFunc, this.showStar=true}) : super(key: key);

  @override
  State<ForumPreview> createState() => _ForumPreviewState();
}

class _ForumPreviewState extends State<ForumPreview> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        MaterialButton(
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
                backgroundColor: Colors.white,
                radius: 15,
              ),
              SizedBox(width: 10,),
              Text(
                "r/" + widget.forum.forumName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Verdana',),
              ),
              Spacer(),
              (widget.showStar ?
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if(Datas().currentUser.starredForums.contains(widget.forum)){
                          Datas().currentUser.starredForums.remove(widget.forum);
                        }else{
                          Datas().currentUser.starredForums.insert(0, widget.forum);
                        }
                        widget.pageSetStateFunc();
                      });
                    },
                    icon:
                    (
                        Datas().currentUser.starredForums.contains(widget.forum) ?
                        Icon(Icons.star_rate_rounded, color: Colors.yellow[900], size: 25,)
                            :
                        Icon(Icons.star_outline_rounded, size: 25, color: provider.isDarkMode ? Colors.grey[400]:Colors.grey[800],)
                    ),
                  )
              :
                  SizedBox()
              ),
            ],
          ),
        ),
      ],
    );
  }
}