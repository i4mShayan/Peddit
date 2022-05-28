import '../libs.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.3),
            radius: 50,
            // child: Datas().currentUser.usrProfileImage,
            child: Image.asset("assets/images/logo/reddit.png"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: InputDecorator(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              child: Center(
                child: Text(
                  // Datas().currentUser.userName,
                  "Username!",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InputDecorator(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                    child: Center(
                      child: Text(
                        // Datas().currentUser.userName,
                        "Username!",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
