import 'dart:ui';
import 'dart:math';
import '../libs.dart';

class EndDrawer extends StatefulWidget {
  Function pageSetState;
  EndDrawer({Key? key, required this.pageSetState}) : super(key: key);

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: Datas().defaultBackground.image,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: Datas().currentUser.userProfileImage.image,
                  backgroundColor: Colors.white,
                  radius: 20,
                ),
                SizedBox(width: 8,),
                Text(
                  "u/",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  Datas().currentUser.userName,
                  style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.orange],
                    ),
                  ),
                  child: MaterialButton(
                    height: 37,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const StadiumBorder(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        const Text(
                          'Log out',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.exit_to_app, size: 25, color: Colors.white,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(thickness: 0.6,),
          ),
          SizedBox(
            height: 37,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(user: Datas().currentUser),
                  ),
                ).then((value) => setState(() {}));
              },
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.person_outline, size: 25),
                  SizedBox(width: 10,),
                  Text(
                    'My profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 37,
            child: InkWell(
              onTap: (){
                setState(() {
                  if(ModalRoute.of(context)?.settings.name=='/navigation_page'){
                    Navigator.pop(context);
                  }
                  Navigator.of(context).popUntil((route) {
                    return route.settings.name == '/navigation_page';
                  });
                  // Navigator.pop(context);
                  Datas().navigationSelectedIndex=1;
                  Datas().pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.ease);
                }
                );
              },
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.group_outlined, size: 25),
                  SizedBox(width: 10,),
                  Text(
                    'My forums',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 37,
            child: InkWell(
              onTap: (){
                setState(() {
                  if(ModalRoute.of(context)?.settings.name=='/navigation_page'){
                    Navigator.pop(context);
                  }
                  Navigator.of(context).popUntil((route) {
                    return route.settings.name == '/navigation_page';
                  });
                  // Navigator.pop(context);
                  Datas().navigationSelectedIndex=3;
                  Datas().pageController.animateToPage(3, duration: Duration(milliseconds: 200), curve: Curves.ease);
                }
                );
              },
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.bookmark_border_rounded, size: 25),
                  SizedBox(width: 10,),
                  Text(
                    'Saved posts',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 37,
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNewForumPage(),
                  ),
                ).then((value) => setState(() {}));
              },
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.group_add_outlined, size: 25,),
                  SizedBox(width: 10,),
                  Text(
                    'Create a forum',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 37,
                width: 127,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      if(ModalRoute.of(context)?.settings.name=='/navigation_page'){
                        Navigator.pop(context);
                      }
                      Navigator.of(context).popUntil((route) {
                        return route.settings.name == '/navigation_page';
                      });
                      // Navigator.pop(context);
                      Datas().navigationSelectedIndex=4;
                      Datas().pageController.animateToPage(4, duration: Duration(milliseconds: 200), curve: Curves.ease);
                    }
                    );
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Icon(Icons.settings_outlined, size: 25,),
                      SizedBox(width: 10,),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){
                    setState((){
                      provider.toggleTheme(!provider.isDarkMode);
                      widget.pageSetState();
                    });
                  },
                  icon: Transform.rotate(
                    angle: 225 * pi / 180,
                    child: provider.isDarkMode ? Icon(Icons.nightlight,):Icon(Icons.nightlight_outlined,),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
