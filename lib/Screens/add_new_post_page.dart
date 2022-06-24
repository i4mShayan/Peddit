import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../libs.dart';

class AddNewPostPage extends StatefulWidget {
  const AddNewPostPage({Key? key}) : super(key: key);

  @override
  State<AddNewPostPage> createState() => _AddNewPostPageState();
}


class _AddNewPostPageState extends State<AddNewPostPage> {

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
  bool canCreatePost=false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
      color: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: provider.isDarkMode ? Colors.grey.shade900:Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close_rounded, size: 30,)),
                      Container(
                        width: 85,
                        margin: const EdgeInsets.only(right: 5,),
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: (canCreatePost ? [Color(0xff374ABE), Colors.blue]:[Color(0xff374ABE).withOpacity(0.6), Colors.blue.withOpacity(0.6)]),
                          ),
                        ),
                        child: MaterialButton(
                          splashColor: canCreatePost ? null:Colors.transparent,
                          highlightColor: canCreatePost ? null:Colors.transparent,
                          onPressed: () {
                            if(canCreatePost) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      SelectForumForNewPost(
                                        feedSetState: () => setState((){}),
                                        title: _postTitle.text,
                                        desc: _postText.text,
                                        postImageFile: imageFile,)),);
                            }
                          },
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 , right: 20 , bottom: 5, top: 5,),
                  child: TextFormField(
                    onChanged: (value){
                      setState(() {
                        canCreatePost = (_postText.text.isNotEmpty && _postTitle.text.isNotEmpty);
                      });
                    },
                    controller: _postTitle,
                    style: TextStyle(
                      fontSize: 30
                    ),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      // hintStyle: TextStyle(
                      //   fontSize: 30,
                      // ),
                      border: InputBorder.none,
                      hintText: "An interesting title",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20 , left: 20),
                  child: TextFormField(
                    onChanged: (value){
                      setState(() {
                        canCreatePost = (_postText.text.isNotEmpty && _postTitle.text.isNotEmpty);
                      });
                    },
                    controller: _postText,
                    maxLines: 20,
                    minLines: 1,
                    cursorColor: Colors.grey[600],
                    style: TextStyle(
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none /*OutlineInputBorder()*/,
                      hintText: "Your text post",
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                (
                imageFile!=null
                    ?
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){
                            setState((){
                              imageFile=null;
                            });
                          }, icon: Icon(Icons.close_rounded)),
                        ],
                      ),
                    ),
                    Image(image: Image.file(imageFile!).image),
                  ],
                )
                    :
                SizedBox()
                ),
                SizedBox(height: 100,),
              ]),
            ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonBar(
                children: [
                  IconButton(
                      onPressed: () => pickImage(ImageSource.gallery),
                      icon: Icon(Icons.photo_outlined,)
                  ),
                  IconButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      icon: Icon(Icons.photo_camera_outlined,)
                  ),
                ],
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
