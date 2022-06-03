import '../libs.dart';

class ForumsList extends StatefulWidget {
  List<ForumModel> forums;
  var pageSetState;
  ForumsList({Key? key, required this.forums, required this.pageSetState}) : super(key: key);

  @override
  State<ForumsList> createState() => _ForumsListState();
}

class _ForumsListState extends State<ForumsList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(ForumModel f in widget.forums) ForumPreview(forum: f, pageSetStateFunc: widget.pageSetState,)
      ],
    );
  }
}
