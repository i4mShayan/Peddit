import 'package:peddit/Screens/forums_page.dart';
import 'package:peddit/libs.dart';

class NavigationPage extends StatefulWidget {

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  PageController _pageController = PageController();

  int _selectedIndex = 0;

  List<Widget> _screens = [
  FeedPage() , ForumsPage() , AddNewPostPage() , SavedPostsPage() , SettingPage()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _pageController.animateToPage(selectedIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  PreferredSizeWidget? _getAppbar() {
          return SlidingAppBar(
              controller: _controller,
              visible: (_selectedIndex == 0 || _selectedIndex == 1 || _selectedIndex == 3) ? true : false,
              child: MainAppBar(() => openDrawer , () => openEndDrawer)
              );
  }

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }


  @override
  Widget build(BuildContext context) {
    return
    Scaffold(

      key: _scaffoldKey,
      appBar: _getAppbar(),
      drawer: Drawer(),
      endDrawer: Drawer(),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75)
            )
          ],
        ),
        child: BottomNavigationBar(
          elevation: 1,
          iconSize: 25,
          type: BottomNavigationBarType.fixed,
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 30),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}