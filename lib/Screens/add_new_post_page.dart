import 'package:peddit/libs.dart';

class AddNewPostPage extends StatefulWidget {
  const AddNewPostPage({Key? key}) : super(key: key);

  @override
  State<AddNewPostPage> createState() => _AddNewPostPageState();
}

class _AddNewPostPageState extends State<AddNewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 20 , right: 20 , bottom: 15),
            child: TextFormField(
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
              maxLines: 19,
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
          Container(
            width: MediaQuery. of(context). size. width,
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.deepOrange, Colors.amber
                ],
              ),
            ),
            child: MaterialButton(
              onPressed: () {},
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const StadiumBorder(),
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
