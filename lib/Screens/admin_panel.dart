import '../libs.dart';

class AdminPanel extends StatelessWidget {
  ForumModel forum;
  AdminPanel({Key? key, required this.forum}) : super(key: key);


  late final List<Map<String, dynamic>> _items = [
    {
      'leading': Icons.edit_rounded,
      'title': "Edit forum",
      'subtitle': "",
      'route': EditForumPage(forum: forum),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => item['route'],
                              ),
                            );
                          },
                          title: Text(item['title']),
                          leading: Icon(item['leading']),
                          subtitle: item['subtitle'].length==0 ? null:Text(item['subtitle']),
                        ),
                    ],
                  )
              ),
            ],
          ),
        ),
    );
  }
}

