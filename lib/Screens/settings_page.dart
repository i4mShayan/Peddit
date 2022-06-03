import '../libs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  double _buttonsHeight=50;
  double _iconsSize=27;
  double _fontSize=16;
  FontWeight _fontWeight=FontWeight.w500;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            onTap: (){},
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
      ],
    );
  }
}
