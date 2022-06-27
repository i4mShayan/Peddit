import '../libs.dart';


class MembersModerationPage extends StatefulWidget {
  ForumModel forum;
  MembersModerationPage({Key? key, required this.forum}) : super(key: key);

  @override
  State<MembersModerationPage> createState() => _MembersModerationPageState();
}

class _MembersModerationPageState extends State<MembersModerationPage> {
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
                        Text("Forum Block List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                          trailing: Icon(Icons.person_remove_rounded, color: Colors.green,),
                        ),
                    ],
                  ),
                  SizedBox(height: 70,),
                ],
              ),
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton:
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlockUserPage(forum: widget.forum),
                  ),
                ).then((value) => setState(() {}));
              },
              label: Text('Block a user'),
              icon: Icon(Icons.block_rounded),
              backgroundColor: Colors.red,
            ),
            // FloatingActionButton(
            //   backgroundColor: Colors.red,
            //   onPressed: (){
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BlockUserPage(forum: widget.forum),
            //       ),
            //     ).then((value) => setState(() {}));
            //   },
            //   child: Icon(Icons.block_rounded),
            // )
        ),
      ),
    );
  }
}
