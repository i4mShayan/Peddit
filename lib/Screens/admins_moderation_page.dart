import '../libs.dart';

class AdminsModerationPage extends StatefulWidget {
  ForumModel forum;
  AdminsModerationPage({Key? key, required this.forum}) : super(key: key);

  @override
  State<AdminsModerationPage> createState() => _AdminsModerationPageState();
}

class _AdminsModerationPageState extends State<AdminsModerationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded, size: 30,
                      )),
                      SizedBox(width: 15,),
                      Text("Admins moderation", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    for(UserModel admin in widget.forum.admins)
                      ListTile(
                        onTap: (){
                          setState((){
                            widget.forum.admins.remove(admin);
                          });
                        },
                        leading: CircleAvatar(
                          child: admin.userProfileImage,
                          backgroundColor: Colors.white,
                        ),
                        title: Text(admin.userName),
                        subtitle: Text(admin.email),
                        trailing: Icon(Icons.person_remove_rounded, color: Colors.red[600],),
                      ),
                  ],
                ),
                SizedBox(height: 70,),
              ],
            ),
          ),
          floatingActionButton:
          // FloatingActionButton.extended(
          //   onPressed: () {},
          //   label: Text('Add a admin'),
          //   icon: Icon(Icons.person_add_rounded),
          //   backgroundColor: Colors.green,
          // ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAdminPage(forum: widget.forum),
                ),
              ).then((value) => setState(() {}));
            },
            child: Icon(Icons.person_add_rounded),
          )
        ),
      ),
    );
  }
}
