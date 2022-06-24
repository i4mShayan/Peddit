import 'dart:ui';
import '../libs.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.red, Colors.deepOrange, Colors.amber])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 40, 30, 40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back_ios,color: Colors.black),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                ),
                              ),
                              Text(
                                "Developed by",
                                style: TextStyle(fontSize: 25, color: Colors.black),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/farbod.png'),
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Farbod Saghafi",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 71),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.black87,
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/logo/github.png", width: 25,),
                                        SizedBox(width: 7,),
                                        Text('itsfarbod', style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 45, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Text(
                                "AND",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 45, left: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/shayan.jpg'),
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Shayan Kebriti",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 65),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      primary: Colors.black87,
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/images/logo/github.png", width: 25,),
                                        SizedBox(width: 7,),
                                        Text('i4mShayan', style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(thickness: 2, color: Colors.black87,),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.4)),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
