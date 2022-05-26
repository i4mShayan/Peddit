import '/libs.dart';

class Forum{
  late String name, photo;
  late bool isStarred;

  Forum({required this.name, this.photo = "", this.isStarred = false});

  static List<Forum> forumsList = [
    Forum(name: "test"),
    Forum(name: "test1"),
    Forum(name: "test2"),
    Forum(name: "test3"),
    Forum(name: "test4"),
    Forum(name: "test5"),
    Forum(name: "test6"),
  ];
  static Map<String, Widget> forumsWidgetsMap = {
    for (Forum forum in forumsList) forum.name: ForumPreview(forum: forum,)
  };
  static List<Widget> forumsWidgetsList = [
    for (Forum forum in forumsList) ForumPreview(forum: forum,)
  ];

  void moveTo(int index) {
    List<Forum> newforumsList=[];
    if (forumsList.indexOf(this) - 1 >= 0) {
      newforumsList.addAll(forumsList.sublist(
          0, forumsList.indexOf(this) - 1));
    }
    if (forumsList.indexOf(this) + 1 >= forumsList.length) {
      newforumsList.addAll(forumsList.sublist(
          forumsList.indexOf(this) + 1, forumsList.length));
    }
    newforumsList.insert(index, this);
    forumsList=newforumsList;
    updateLists();
  }

  void updateLists(){
    forumsWidgetsMap = {
      for (Forum forum in forumsList) forum.name: ForumPreview(forum: forum,)
    };

    forumsWidgetsList = [
      for (Forum forum in forumsList) ForumPreview(forum: forum,)
    ];
  }
}