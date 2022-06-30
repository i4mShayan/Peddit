import '../libs.dart';


class ProfilePage extends StatefulWidget {
  UserModel user;
  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  double profileRadius=70;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);}, icon: Icon(Icons.close_rounded, size: 30,
                      )),
                      SizedBox(width: 15,),
                      Text("Profile page", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Stack(
                    children: [
                      ClipOval(
                        child: Material(
                          // color: Colors.transparent,
                          child: Ink.image(
                            image: widget.user.userProfileImage.image,
                            fit: BoxFit.cover,
                            width: profileRadius*2,
                            height: profileRadius*2,
                            child: (widget.user == CurrentUser().user ? InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfilePage(user: widget.user),
                                  ),
                                ).then((value) => setState(() {}));
                              },
                            ):SizedBox()),
                          ),
                        ),
                      ),
                      (widget.user == CurrentUser().user ?
                      Positioned(
                        bottom: 0,
                        right: 5,
                        child: ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
                            child: ClipOval(
                              child: Container(
                                padding: EdgeInsets.all(6),
                                color: Colors.blue,
                                child: Icon(Icons.edit_rounded, color: Colors.white, size: 18,)
                              ),
                            ),
                          ),
                        ),
                      )
                          :
                      SizedBox()),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("r/", style: TextStyle( fontSize: 24),),
                        Text(widget.user.userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(widget.user.email, style: TextStyle(color: Colors.grey, fontSize: 15),),
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 65,
                      child: Column(
                        children: [
                          Text(widget.user.userPostsCount.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                          SizedBox(height: 3,),
                          Text("Total\nPosts", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(child: VerticalDivider(thickness: 2,), height: 45,),
                    SizedBox(width: 15,),

                    SizedBox(
                      width: 65,
                      child: Column(
                        children: [
                          Text(widget.user.commentsCount.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                          SizedBox(height: 3,),
                          Text("Total\nComments", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(child: VerticalDivider(thickness: 2,), height: 45,),
                    SizedBox(width: 15,),
                    SizedBox(
                      width: 65,
                      child: Column(
                        children: [
                          Text(widget.user.followedForums.length.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                          SizedBox(height: 3,),
                          Text("Followed\nForums", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12), textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
