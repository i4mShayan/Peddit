import 'dart:ui';
import 'dart:math';
import '../libs.dart';

class ProfilePreview extends StatefulWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  State<ProfilePreview> createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AssetImage("assets/images/profile_background.png"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/images/default_profile.png'),
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
                  "Username",
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
              onTap: (){},
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.person_outline, size: 25, color: Colors.grey[900],),
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
              onTap: (){},
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.group_outlined, size: 25, color: Colors.grey[900],),
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
              onTap: (){},
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.group_add_outlined, size: 25, color: Colors.grey[900],),
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
                    Navigator.pushNamed(context, '/about_us');
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      Icon(Icons.info_outline, size: 25, color: Colors.grey[900],),
                      SizedBox(width: 10,),
                      Text(
                        'About us',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Transform.rotate(
                    angle: 225 * pi / 180,
                    child: Icon(Icons.nightlight_outlined),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
