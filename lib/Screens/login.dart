import 'dart:math';

import '../libs.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  TextEditingController _username=TextEditingController();
  TextEditingController _password=TextEditingController();

  Future<void> userLogin(String username, String password) async {
    await Socket.connect(ServerInfo.ip, ServerInfo.port).then((socket) {
      socket.write("@$username/Login#$password" + "\u0000");
      socket.flush();
      socket.listen((response) {
        String responseString = String.fromCharCodes(response);
        print("$responseString");
        if (responseString == "UserDidNotfound") {
          showDialogWith(context: context, title: "can't login!", content: "username/password not correct!");
        }
        else {
          Datas().currentUser=UserModel.fromJson(jsonDecode(responseString));
          AppDatas().loggedIn=true;
          Navigator.of(context).pushNamedAndRemoveUntil('/navigation_page', (route) => false);

          SnackBar snackBar = SnackBar(
            backgroundColor: Colors.green,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Icon(Icons.emoji_emotions_outlined, color: Colors.white,),
                SizedBox(width: 10,),
                Text('Welcome back', style: TextStyle(color: Colors.white),),
              ],
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
      socket.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child:
                      IconButton(
                          onPressed: (){
                            setState((){
                              provider.toggleTheme(!provider.isDarkMode);
                            });
                          },
                          icon: Transform.rotate(
                            angle: 325 * pi / 180,
                            child: provider.isDarkMode ? Icon(Icons.nightlight, size: 30,):Icon(Icons.nightlight_outlined, size: 30,),
                          )
                      ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: (
                        provider.isDarkMode ?
                        Image.asset(
                          'assets/images/logo/reddit_with_text_darkmode.png',
                          width: 120,
                        )
                            :
                        Image.asset(
                          'assets/images/logo/reddit_with_text.png',
                          width: 120,
                        )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right:10,),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil('/sign_up', (route) => false);
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Log in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextButton.icon(
                        onPressed: () {
                          showDialogWith(title: 'Coming Soon!', content: 'we appreciate your patience!', context: context);
                        },
                        icon: Image.asset(
                          "assets/images/logo/google.png",
                          width: 37,
                        ),
                        label: Text(
                          "Continue with Google",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.white,
                          onPrimary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.blue),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 45, right: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 45, left: 10),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  hintText: "Username",
                  // fillColor: Colors.grey[500],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: _password,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.deepOrange, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom:30, left: 20, right: 20),
                    height: 60,
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.red, Colors.orange],
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        userLogin(_username.text, _password.text);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const StadiumBorder(),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
