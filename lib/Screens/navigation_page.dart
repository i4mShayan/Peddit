import '../libs.dart';

class NavigationPage extends StatefulWidget {

  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  PageController _pageController = Datas().pageController;
  int _selectedIndex = Datas().navigationSelectedIndex;

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


  double iconSizeWhenSelected=30;

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      key: _scaffoldKey,
      appBar: _getAppbar(),
      drawer: DrawerMenu(),
      endDrawer: EndDrawer(),
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
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex==0 ? Icon(Icons.home, size: iconSizeWhenSelected):Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex==1 ? Icon(Icons.list_alt, size: iconSizeWhenSelected):Icon(Icons.list_alt_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex==2 ? Icon(Icons.add_circle_rounded, size: iconSizeWhenSelected,):Icon(Icons.add_circle_outline_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex==3 ? Icon(Icons.bookmark_rounded, size: iconSizeWhenSelected):Icon(Icons.bookmark_outline_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex==4 ? Icon(Icons.settings, size: iconSizeWhenSelected):Icon(Icons.settings_outlined),
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