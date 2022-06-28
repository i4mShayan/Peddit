import '../libs.dart';

class ForumSearchDelegate extends SearchDelegate {


  List<ForumModel> forums;
  ForumSearchDelegate({required this.forums});

  // @override
  // ThemeData appBarTheme(BuildContext context){
  //   final provider = Provider.of<ThemeProvider>(context, listen: true);
  //   assert(context != null);
  //   final ThemeData theme = Theme.of(context);
  //   assert(theme != null);
  //   return theme.copyWith(
  //     primaryColor: Colors.grey[50],
  //   );
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear_rounded),
        onPressed: () {
          if(query.isEmpty){
            close(context, null);
          }else{
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
          Icons.arrow_back_rounded
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ForumModel> results = forums
        .where(
            (forum) => forum.forumName.contains(query)
    ).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ForumPreview(
              forum: results[index],
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ForumModel> suggested = forums
        .where(
            (forum) => forum.forumName.contains(query)
    ).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: query.isEmpty ? SizedBox():ListView.builder(
          itemCount: suggested.length,
          itemBuilder: (context, index) {
            return ForumPreview(
              forum: suggested[index],
              showStar: false,
            );
          }
      ),
    );
  }
}