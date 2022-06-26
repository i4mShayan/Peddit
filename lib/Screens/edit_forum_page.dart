import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../libs.dart';

class EditForumPage extends StatefulWidget {
  ForumModel forum;
  EditForumPage({Key? key, required this.forum}) : super(key: key);

  @override
  State<EditForumPage> createState() => _EditForumPageState();
}

class _EditForumPageState extends State<EditForumPage> {

  late TextEditingController _postText=TextEditingController();
  late TextEditingController _postTitle=TextEditingController();

  File? profileImageFile;
  Future pickProfile(ImageSource source) async{
    try{
      final image = await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imageTemp=File(image.path);
      setState(() => this.profileImageFile=imageTemp);
    }on PlatformException catch(e){
      print(e);
    }
  }
  File? headerImageFile;
  Future pickHeader(ImageSource source) async{
    try{
      final image = await ImagePicker().pickImage(source: source);
      if(image==null) return;
      final imageTemp=File(image.path);
      setState(() => this.headerImageFile=imageTemp);
    }on PlatformException catch(e){
      print(e);
    }
  }


  String? nameErrorMessage=null;
  String? descErrorMessage=null;


  TextEditingController _name=TextEditingController();
  TextEditingController _desc=TextEditingController();

  String? forumNameError(){
    return _name.text.isEmpty ? "Forum name can't be empty!" : null;
  }

  @override
  void initState() {
    _name.text=widget.forum.forumName;
    _desc.text=widget.forum.forumDesc;
  }

  double profileRadius=70;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 0, bottom:5, left: 20, right: 20),
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
                      setState((){
                        nameErrorMessage=forumNameError();
                      });
                      if(nameErrorMessage==null) {
                        setState(() {
                          widget.forum.forumName= _name.text;
                          widget.forum.forumDesc= _desc.text;
                          widget.forum.forumCreateTime= DateTime.now();
                          widget.forum.profileImage= profileImageFile == null ? widget.forum.profileImage : Image.file(profileImageFile!);
                          widget.forum.headerImage= headerImageFile == null ? widget.forum.headerImage : Image.file(headerImageFile!);
                          Navigator.of(context).pop();

                          SnackBar snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.emoji_emotions_outlined, color: Colors.white,),
                                  SizedBox(width: 10,),
                                  Text('Forum changes saved', style: TextStyle(color: Colors.white),),
                                  Spacer(),
                                  Icon(Icons.check, color: Colors.white,)
                                ],
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
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
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
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
                      Text("Edit forum", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Material(
                        // color: Colors.transparent,
                        child: Ink.image(
                          image: headerImageFile==null ? widget.forum.headerImage.image:Image.file(headerImageFile!).image,
                          fit: BoxFit.cover,
                          // width: profileRadius*3,
                          height: profileRadius*4,
                          child: InkWell(
                            onTap: ()=>pickHeader(ImageSource.gallery),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: ClipOval(
                          child: ClipOval(
                            child: Container(
                                padding: EdgeInsets.all(7),
                                color: Colors.blue,
                                child: Icon(Icons.add_photo_alternate_rounded, color: Colors.white, size: 20,)
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -30,
                        left: 20,
                        child: Container(
                          decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.withOpacity(0.5),
                              //     spreadRadius: 3,
                              //     blurRadius: 30,
                              //     offset: Offset(0, 5), // changes position of shadow
                              //   ),
                              // ],
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Stack(
                            children: [
                              ClipOval(
                                child: Material(
                                  // color: Colors.transparent,
                                  child: Ink.image(
                                    image: profileImageFile==null ? widget.forum.profileImage.image:Image.file(profileImageFile!).image,
                                    fit: BoxFit.cover,
                                    width: profileRadius*1.5,
                                    height: profileRadius*1.5,
                                    child: InkWell(
                                      onTap: ()=>pickProfile(ImageSource.gallery),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -2,
                                right: 6,
                                child: ClipOval(
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
                                    child: ClipOval(
                                      child: Container(
                                          padding: EdgeInsets.all(4),
                                          color: Colors.blue,
                                          child: Icon(Icons.add_photo_alternate_rounded, color: Colors.white, size: 15,)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    autofocus: true,
                    controller: _name,
                    onChanged: (value){},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.deepOrange, width: 2)
                      ),
                      filled: true,
                      hintText: "Forum name" ,
                      errorText: nameErrorMessage,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextField(
                    autofocus: true,
                    minLines: 3,
                    maxLines: 20,
                    controller: _desc,
                    onChanged: (value){
                      // setState(() { });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.deepOrange, width: 2)
                      ),
                      filled: true,
                      hintText: "About forum",
                      errorText: descErrorMessage,

                    ),
                  ),
                ),
                SizedBox(height: 100,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
