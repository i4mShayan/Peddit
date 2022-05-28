import '../libs.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Align(alignment: Alignment.centerLeft ,child: Text("Profile setting")),
          Container(
            child: Row(
              children: [
                Container(child: Icon(Icons.account_circle_outlined , size: 50, color: Colors.grey[800],)),
                Container(margin: EdgeInsets.only(left: 10) , child: Text("Profile Setting" , style: TextStyle(fontSize: 20 , fontFamily: "Open Sans"),)),
              ],
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 10 , left: 5 , right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.deepOrange, width: 1.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10 , left: 5 , right: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.deepOrange, width: 1.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(child: Icon(Icons.list_alt_rounded, size: 50, color: Colors.grey[800],)),
                Container(margin: EdgeInsets.only(left: 10) , child: Text("Manage your forums" , style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Icon(Icons.bedtime_outlined, size: 50, color: Colors.grey[800],)),
                Expanded(child: Container(margin: EdgeInsets.only(left: 10) ,child: Text("Dark theme" , style: TextStyle(fontSize: 20)),)),
                Switch(
                  onChanged: toggleSwitch,
                  value: isSwitched,
                  activeColor: Colors.deepOrange,
                  activeTrackColor: Colors.grey[200],
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey,
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: 10 , left: 5 , right: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.deepOrange, width: 1.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.white,
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(child: Icon(Icons.info_outline_rounded, size: 50, color: Colors.grey[800],)),
                Container(margin: EdgeInsets.only(left: 10) , child: Text("Manage your forums" , style: TextStyle(fontSize: 20),)),
              ],
            ),
            margin: EdgeInsets.only(bottom: 10 , left: 5 , right: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.deepOrange, width: 1.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2.0,
                    offset: Offset(0.0, 0.75))
              ],
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
