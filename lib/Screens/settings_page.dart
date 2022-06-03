import 'dart:math';

import '../libs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  double _buttonsHeight=40;
  double _iconsSize=27;
  double _fontSize=16;
  FontWeight _fontWeight=FontWeight.w500;

  void _onDarkModeSelection(){
    setState((){
      Datas().darkMode=!Datas().darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
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
                  height: _buttonsHeight,
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
          height: _buttonsHeight,
          child: InkWell(
            onTap: (){},
            child: Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.person_outline, size: _iconsSize, color: Colors.grey[900],),
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
                Datas().navigationSelectedIndex=1;
                Datas().pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.ease);
              });
            },
            child: Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.group_outlined, size: _iconsSize, color: Colors.grey[900],),
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
              setState((){
                Datas().navigationSelectedIndex=3;
                Datas().pageController.animateToPage(3, duration: Duration(milliseconds: 200), curve: Curves.ease);
              });
            },
            child: Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.bookmark_border_rounded, size: _iconsSize, color: Colors.grey[900],),
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
            onTap: (){},
            child: Row(
              children: [
                SizedBox(width: 15,),
                Icon(Icons.group_add_outlined, size: _iconsSize, color: Colors.grey[900],),
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
        Spacer(),
        SizedBox(
          height: _buttonsHeight*1.5,
          child: InkWell(
            onTap: (){
              _onDarkModeSelection();
            },
            child: Row(
              children: [
                SizedBox(width: 15,),
                Transform.rotate(
                  angle: 315 * pi / 180,
                  child: Datas().darkMode ? Icon(Icons.nightlight, color: Colors.black, size: _iconsSize,):Icon(Icons.nightlight_outlined, color: Colors.black, size: _iconsSize,),
                ),
                SizedBox(width: 10,),
                Text("Dark mode", style: TextStyle(
                  fontWeight: _fontWeight,
                  fontSize: _fontSize,
                ),),
                Spacer(),
                Switch(
                  activeColor: Colors.black,
                  value: Datas().darkMode,
                  onChanged: (value){
                    _onDarkModeSelection();
                  }
                ),
                SizedBox(width: 10,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
