import 'package:peddit/libs.dart';

class ForumsList extends StatefulWidget {
  const ForumsList({Key? key}) : super(key: key);


  @override
  State<ForumsList> createState() => _ForumsListState();
}

class _ForumsListState extends State<ForumsList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: Forum.forumsWidgetsList,
        ),
      ),
    );
  }
}
