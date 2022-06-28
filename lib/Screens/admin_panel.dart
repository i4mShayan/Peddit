import '../libs.dart';

class AdminPanel extends StatelessWidget {
  ForumModel forum;
  AdminPanel({Key? key, required this.forum}) : super(key: key);


  late final List<Map<String, dynamic>> _items = [
    {
      'leading': Icons.edit_rounded,
      'title': "Edit forum",
      'subtitle': "change forum name, description & photos!",
      'route': EditForumPage(forum: forum),
      'enabled': ()=>true,
    },
    {
      'leading': Icons.admin_panel_settings_rounded,
      'title': "Admins moderation",
      'subtitle': "add/remove an admin!",
      'route': AdminsModerationPage(forum: forum),
      'enabled': ()=>forum.owner == Datas().currentUser,
    },
    {
      'leading': Icons.block_rounded,
      'title': "Members moderation",
      'subtitle': "block/unblock a member!",
      'route': MembersModerationPage(forum: forum),
      'enabled': ()=>forum.admins.contains(Datas().currentUser) || forum.owner == Datas().currentUser,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close_rounded, size: 30,)),
                      const SizedBox(width: 15,),
                      const Text("Admin Panel", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                      const Spacer(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for(dynamic item in _items)
                          ListTile(
                            enabled: item['enabled'](),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => item['route'],
                                ),
                              );
                            },
                            title: Text(item['title']),
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(item['leading']),
                                ],
                              ),
                            ),
                            subtitle: item['subtitle'].length==0 ? null:Text(item['subtitle']),
                          ),
                      ],
                    )
                ),
              ],
            ),
          ),
      ),
    );
  }
}

