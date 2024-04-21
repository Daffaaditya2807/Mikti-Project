import 'package:build_ui/ui/add_story_screen.dart';
import 'package:build_ui/ui/greeting.dart';
import 'package:build_ui/ui/info_detail_screen.dart';
import 'package:build_ui/ui/menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageSelected = 0;
  final PageController _myPage = PageController();
  List<Widget> screenUi = [const GreetingScreen(), const MenuScreen()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: _appBar(),
        body: PageView(
          controller: _myPage,
          onPageChanged: (value) {
            print("this page $value");
          },
          children: screenUi,
        ),
        drawer: _drawer(context),
        floatingActionButton: _floatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _navbar());
  }

  BottomAppBar _navbar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.grey.shade100,
      notchMargin: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _myPage.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      pageSelected = 0;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    color:
                        pageSelected == 0 ? Colors.pink : Colors.pink.shade100,
                  )),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 3,
                  width: pageSelected == 0 ? 30 : 0, // Menganimasikan lebar
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10)),
                  curve: Curves.easeOut),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _myPage.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      pageSelected = 1;
                    });
                  },
                  icon: Icon(
                    Icons.shopify_outlined,
                    color:
                        pageSelected == 1 ? Colors.pink : Colors.pink.shade100,
                  )),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 3,
                  width: pageSelected == 1 ? 30 : 0, // Menganimasikan lebar
                  decoration: BoxDecoration(
                      color: Colors.pink,
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
      backgroundColor: Colors.pink.shade300,
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
