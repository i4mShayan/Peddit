import '../libs.dart';


class BlockUserPage extends StatefulWidget {
  ForumModel forum;
  BlockUserPage({Key? key, required this.forum}) : super(key: key);

  @override
  State<BlockUserPage> createState() => _BlockUserPageState();
}

class _BlockUserPageState extends State<BlockUserPage> {
  UserModel? _selected;

  bool canConfirm(){
    return _selected!=null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    List<UserModel> notBlockedMembers=[];
    notBlockedMembers.addAll(widget.forum.members);
    notBlockedMembers.removeWhere((element) => widget.forum.blockedUsers.contains(element));
    return Container(
      color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded, size: 30,)),
                      SizedBox(width: 15,),
                      Text("Block user", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Container(
                        width: 85,
                        margin: const EdgeInsets.only(right: 5,),
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: (canConfirm() ? [Color(0xff374ABE), Colors.blue]:[Color(0xff374ABE).withOpacity(0.6), Colors.blue.withOpacity(0.6)]),
                          ),
                        ),
                        child: MaterialButton(
                            splashColor: canConfirm() ? null:Colors.transparent,
                            highlightColor: canConfirm() ? null:Colors.transparent,
                            onPressed: () {
                              if(canConfirm()){
                                setState((){
                                  widget.forum.blockedUsers.add(_selected!);
                                });
                                Navigator.pop(context);
                              }
                            },
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.check, color: Colors.white,)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7,),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notBlockedMembers.length,
                  itemBuilder: (context, i){
                    return RadioListTile(
                      value: notBlockedMembers[i],
                      groupValue: _selected,
                      onChanged: (value){
                        setState((){
                          _selected=value as UserModel?;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.blue[700],
                      title: Text(notBlockedMembers[i].userName),
                      subtitle: Text(notBlockedMembers[i].email),
                      secondary: CircleAvatar(
                        backgroundImage: notBlockedMembers[i].userProfileImage.image,
                        backgroundColor: Colors.white,
                        // radius: 15,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

