import 'dart:math';

import '../libs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  double _buttonsHeight=43;
  double _iconsSize=27;
  double _fontSize=16;
  FontWeight _fontWeight=FontWeight.w500;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: CurrentUser().user.userProfileImage.image,
                        radius: 20,
                      ),
                      SizedBox(width: 12,),
                      Text(
                        "u/",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        CurrentUser().user.userName,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    // width: 170,
                    margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.red, Colors.orange],
                      ),
                    ),
                    child: MaterialButton(
                      height: _buttonsHeight,
                      onPressed: () {
                        AppDatas().loggedIn=false;
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
              child: Divider(thickness: 2,),
            ),
            SizedBox(
              height: _buttonsHeight,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(user: CurrentUser().user,),
                    ),
                  ).then((value) => setState(() {}));
                },
                child: Row(
                  children: [
                    SizedBox(width: 16,),
                    Icon(Icons.person_outline, size: _iconsSize,),
                    SizedBox(width: 10,),
                    Text(
                      'My profile',
                      style: TextStyle(
                        fontWeight: _fontWeight,
                        fontSize: _fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _buttonsHeight,
              child: InkWell(
                onTap: (){
                  setState((){
                    AppDatas().navigationSelectedIndex=1;
                    AppDatas().pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.ease);
                  });
                },
                child: Row(
                  children: [
                    SizedBox(width: 16,),
                    Icon(Icons.group_outlined, size: _iconsSize,),
                    SizedBox(width: 10,),
                    Text(
                      'My forums',
                      style: TextStyle(
                        fontWeight: _fontWeight,
                        fontSize: _fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _buttonsHeight,
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
                    SizedBox(width: 17,),
                    Icon(Icons.group_add_outlined, size: _iconsSize),
                    SizedBox(width: 10,),
                    Text(
                      'Create a forum',
                      style: TextStyle(
                        fontWeight: _fontWeight,
                        fontSize: _fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _buttonsHeight,
              child: InkWell(
                onTap: (){
                  setState((){
                    AppDatas().navigationSelectedIndex=3;
                    AppDatas().pageController.animateToPage(3, duration: Duration(milliseconds: 200), curve: Curves.ease);
                  });
                },
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(Icons.bookmark_border_rounded, size: _iconsSize,),
                    SizedBox(width: 10,),
                    Text(
                      'Saved posts',
                      style: TextStyle(
                        fontWeight: _fontWeight,
                        fontSize: _fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _buttonsHeight,
              child: InkWell(
                onTap: (){
                  setState((){
                    provider.toggleTheme(!provider.isDarkMode);
                  });
                },
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Transform.rotate(
                      angle: 315 * pi / 180,
                      child: provider.isDarkMode ? Icon(Icons.nightlight, color: Colors.white, size: _iconsSize,):Icon(Icons.nightlight_outlined, color: Colors.black, size: _iconsSize,),
                    ),
                    SizedBox(width: 10,),
                    Text("Dark mode", style: TextStyle(
                      fontWeight: _fontWeight,
                      fontSize: _fontSize,
                    ),),
                    Spacer(),
                    Switch(
                      activeColor: Colors.white,
                      value: provider.isDarkMode,
                      onChanged: (value){
                        setState((){
                          provider.toggleTheme(!provider.isDarkMode);
                        });
                      }
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _buttonsHeight,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/about_us');
                },
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(Icons.info_outline_rounded, size: _iconsSize,),
                    SizedBox(width: 10,),
                    Text(
                      'About us',
                      style: TextStyle(
                        fontWeight: _fontWeight,
                        fontSize: _fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
