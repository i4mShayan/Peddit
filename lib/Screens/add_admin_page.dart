import '../libs.dart';

class AddAdminPage extends StatefulWidget {
  ForumModel forum;
  AddAdminPage({Key? key, required this.forum}) : super(key: key);

  @override
  State<AddAdminPage> createState() => _AddAdminPageState();
}

class _AddAdminPageState extends State<AddAdminPage> {

  UserModel? _selected;

  bool canConfirm(){
    return _selected!=null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
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
                      Text("Make admin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                                widget.forum.admins.add(_selected!);
                              });
                              Navigator.pop(context);
                            }
                          },
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.check)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7,),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.forum.admins.length,
                  itemBuilder: (context, i){
                    return RadioListTile(
                      value: widget.forum.admins[i],
                      groupValue: _selected,
                      onChanged: (value){
                        setState((){
                          _selected=value as UserModel?;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.blue[700],
                      title: Text(widget.forum.admins[i].userName),
                      subtitle: Text(widget.forum.admins[i].email),
                      secondary: CircleAvatar(
                        backgroundImage: widget.forum.admins[i].userProfileImage.image,
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
