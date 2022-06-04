import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../libs.dart';

class EditProfilePage extends StatefulWidget {
  UserModel user;
  EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  File? imageFile;
  late TextEditingController _postText=TextEditingController();
  late TextEditingController _postTitle=TextEditingController();
  Future pickImage(ImageSource source) async{
    try{
      final image = await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imageTemp=File(image.path);
      setState(() => this.imageFile=imageTemp);
    }on PlatformException catch(e){
      print(e);
    }
  }

  String? emailErrorMessage=null;
  String? usernameErrorMessage=null;
  String? passwordErrorMessage=null;

  bool _passwordVisible = false;


  TextEditingController _email=TextEditingController();
  TextEditingController _username=TextEditingController();
  TextEditingController _password=TextEditingController();

  @override
  void initState() {
  _passwordVisible = false;
  _email.text=widget.user.email;
  _username.text=widget.user.userName;
  _password.text=widget.user.password;
  }

  double profileRadius=70;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded, size: 30,
                    )),
                    SizedBox(width: 15,),
                    Text("Edit profile page", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
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
                          image: imageFile==null ? widget.user.userProfileImage.image:Image.file(imageFile!).image,
                          fit: BoxFit.cover,
                          width: profileRadius*2,
                          height: profileRadius*2,
                          child: InkWell(
                            onTap: ()=>pickImage(ImageSource.gallery),
                          ),
                        ),
                      ),
                    ),
                    (widget.user == Datas().currentUser ?
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: ClipOval(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.white,
                          child: ClipOval(
                            child: Container(
                                padding: EdgeInsets.all(7),
                                color: Colors.blue,
                                child: Icon(Icons.add_a_photo, color: Colors.white, size: 20,)
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
              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  autofocus: true,
                  controller: _email,
                  onChanged: (value){
                    emailErrorMessage=emailError(_email);
                    setState(() { });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "New email" ,
                    errorText: emailErrorMessage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextField(
                  autofocus: true,
                  controller: _username,
                  onChanged: (value){
                    usernameErrorMessage=usernameError(_username);
                    setState(() { });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "New username",
                    errorText: usernameErrorMessage,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  autofocus: true,
                  controller: _password,
                  onChanged: (value){
                    passwordErrorMessage=passwordError(_password);
                    setState(() { });
                  },
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "New password",
                    errorText: passwordErrorMessage,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blue,
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
                          colors: [Color(0xff374ABE), Colors.blue],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if(signupHasError(_email, _username, _password)){
                            setState(() {
                              emailErrorMessage=emailError(_email);
                              usernameErrorMessage=usernameError(_username);
                              passwordErrorMessage=passwordError(_password);
                            });
                            // showDialogWith(context: context, title: 'Wrong fields', content: 'Fill all fields correctly!');
                          }
                          else{
                            widget.user.userName=_username.text;
                            widget.user.email=_email.text;
                            widget.user.password=_password.text;
                            if(imageFile!=null) {
                              widget.user.userProfileImage =
                                  Image.file(imageFile!);
                            }
                            Navigator.pop(context);
                            SnackBar snackBar = SnackBar(
                              backgroundColor: Colors.green,
                              content: Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.emoji_emotions_outlined, color: Colors.white,),
                                    SizedBox(width: 10,),
                                    Text('Profile changes saved'),
                                    Spacer(),
                                    Icon(Icons.check, color: Colors.white,)
                                  ],
                                ),
                              ),
                              duration: Duration(milliseconds: 5000),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const StadiumBorder(),
                        child: const Text(
                          'Save',
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
      ),
    );
  }
}
