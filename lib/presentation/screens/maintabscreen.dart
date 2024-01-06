import 'package:ex_showtime/presentation/provider/maintap_provider.dart';
import 'package:ex_showtime/presentation/screens/downloadscreen.dart';
import 'package:ex_showtime/presentation/screens/homescreen.dart';
import 'package:ex_showtime/presentation/screens/profilescreen.dart';
import 'package:ex_showtime/presentation/screens/searchscreen.dart';
import 'package:ex_showtime/presentation/screens/upcomingscreen.dart';
import 'package:flutter/material.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key, required this.mainTabProvider});

  final MainTabProvider mainTabProvider;

  static List<Widget> tabScreenList = [
    HomeScreen(),
    UpComingScreen(),
    DownloadScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.mainTabProvider.mainTabController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    widget.mainTabProvider.updataGenrnList();
    widget.mainTabProvider.updataTopRateMovieList();
    widget.mainTabProvider.addListener(() => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('asset/images/show_logo.png', width: 30),
        actions: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width - 60,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.mainTabProvider.genreList.length,
              itemBuilder: (context, index) =>
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        widget.mainTabProvider.genreList[index].name,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
            ),
          ),
        ],
        backgroundColor: Color(0xff232936),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: widget.mainTabProvider.mainTabController.hasClients
            ? BottomNavigationBar(
          onTap: (value) =>
              widget.mainTabProvider.mainTabController.jumpToPage(value),
          currentIndex: widget.mainTabProvider.mainTabController.page
              ?.round() ?? 0,
          items: [
          ],
        )
            : SizedBox(),
      ),
      body: PageView.builder(
        controller: widget.mainTabProvider.mainTabController,
        itemCount: MainTabScreen.tabScreenList.length,
        itemBuilder: (context, index) => MainTabScreen.tabScreenList[index],
      ),
    );
  }

  Widget _buildTabButton(
      {required String name, required Widget Icon, required bool isSelected}) =>
      Column

  (

  children: [
  Icon,
  SizedBox(height: 8),
  Text(
  name,
  style: TextStyle(
  fontSize: 16,
  color: isSelected
  ? Color(0xffF75E04) : Colors.white,
  ),
  ],
  );
}
