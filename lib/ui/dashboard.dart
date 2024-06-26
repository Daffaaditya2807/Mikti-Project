import 'package:build_ui/component/list_color.dart';
import 'package:build_ui/ui/home.dart';
import 'package:build_ui/ui/learn_mikti/add_story_screen.dart';
import 'package:build_ui/ui/learn_mikti/info_detail_screen.dart';
import 'package:build_ui/ui/learn_mikti/menu.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageSelected = 0;
  final PageController _myPage = PageController();
  List<Widget> screenUi = [
    Home(),
    const MenuScreen(),
    Center(
      child: Text("3"),
    ),
    Center(
      child: Text("4"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        // appBar: _appBar(),
        body: PageView(
          controller: _myPage,
          onPageChanged: (value) {
            setState(() {
              pageSelected = value;
            });

            print("this page $value");
          },
          children: screenUi,
        ),
        // drawer: _drawer(context),
        floatingActionButton: _floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _navbar());
  }

  BottomAppBar _navbar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: orange,
      elevation: 0.5,
      notchMargin: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      // _myPage.animateToPage(0,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.easeInOut);
                      _myPage.jumpToPage(0);
                      pageSelected = 0;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    color: pageSelected == 0
                        ? baseYellow
                        : Color.fromRGBO(255, 251, 218, 1),
                  )),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 3,
                  width: pageSelected == 0 ? 30 : 0, // Menganimasikan lebar
                  decoration: BoxDecoration(
                      color: baseYellow,
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.easeOut),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      // _myPage.animateToPage(1,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.easeInOut);
                      _myPage.jumpToPage(1);
                      pageSelected = 1;
                    });
                  },
                  icon: Icon(
                    Icons.article,
                    color: pageSelected == 1
                        ? baseYellow
                        : Color.fromRGBO(255, 251, 218, 1),
                  )),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 3,
                  width: pageSelected == 1 ? 30 : 0, // Menganimasikan lebar
                  decoration: BoxDecoration(
                      color: baseYellow,
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.easeInOut),
            ],
          ),
          Container(
            width: 80,
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      // _myPage.animateToPage(2,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.easeInOut);
                      _myPage.jumpToPage(2);
                      pageSelected = 2;
                    });
                  },
                  icon: Icon(
                    Icons.history,
                    color: pageSelected == 2
                        ? baseYellow
                        : Color.fromRGBO(255, 251, 218, 1),
                  )),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 3,
                  width: pageSelected == 2 ? 30 : 0, // Menganimasikan lebar
                  decoration: BoxDecoration(
                      color: baseYellow,
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.easeInOut),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      // _myPage.animateToPage(3,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.easeInOut);
                      _myPage.jumpToPage(3);
                      pageSelected = 3;
                    });
                  },
                  icon: Icon(
                    Icons.person_2,
                    color: pageSelected == 3
                        ? baseYellow
                        : Color.fromRGBO(255, 251, 218, 1),
                  )),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 3,
                  width: pageSelected == 3 ? 30 : 0, // Menganimasikan lebar
                  decoration: BoxDecoration(
                      color: baseYellow,
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.easeInOut),
            ],
          )
        ],
      ),
    );
  }

  FloatingActionButton _floatButton() {
    return FloatingActionButton(
      tooltip: 'Increment',
      backgroundColor: orange,
      shape: const CircleBorder(),
      onPressed: () {
        const Drawer();
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Material(
              color: Colors.pink.shade300,
              child: InkWell(
                onTap: () {
                  /// Close Navigation drawer before
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top, bottom: 24),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(
                              'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2022/02/09/2625919708.jpeg'
                              // 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c21pbHklMjBmYWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Caitlin Halderman',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '@Caitlin.com',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Header Menu items
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.shade100),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.book,
                          color: Colors.white,
                        ),
                      )),
                  title: const Text('Add Story'),
                  onTap: () {
                    /// Close Navigation drawer before
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddStoryScreen()),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.shade100),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.fast_forward,
                          color: Colors.white,
                        ),
                      )),
                  title: const Text('Detail Screen'),
                  onTap: () {
                    /// Close Navigation drawer before
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InfoDetailScreen()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("Waspada AI"),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.info),
        )
      ],
      backgroundColor: Colors.pink.shade300,
      foregroundColor: Colors.white,
    );
  }
}
