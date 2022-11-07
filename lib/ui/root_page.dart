import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pineda_flutter/Constants.dart';
import 'package:pineda_flutter/pages/Dashboard.dart';
import 'package:pineda_flutter/ui/screens/messages_page.dart';
import 'package:pineda_flutter/ui/screens/favorite_page.dart';
import 'package:pineda_flutter/ui/screens/profile_page.dart';
import 'package:pineda_flutter/ui/screens/add_page.dart';
import 'package:pineda_flutter/ui/screens/Settings.dart';


class RootPage extends StatefulWidget {
  static const String routeName = 'RootPage';
  final String email;
  const RootPage(this.email);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  
  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      Dashboard(widget.email),
      FavoritePage(),
      MessagesPage(),
      const ProfilePage(),
      Settings(),
   ];
  }
   
  

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.message,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Messages',
    'Profile',
    'Settings',
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),),
            GestureDetector(
              child: Icon(Icons.settings, color: Constants.blackColor, size: 30.0,),
              onTap: () {
                  Navigator.push(context, PageTransition(child: Settings(), type: PageTransitionType.bottomToTop));
                },

            ),

            
          ],
        ),

        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body:IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: const AddPage(), type: PageTransitionType.bottomToTop));
        },

        child: Image.asset('assets/images/add_icon.png', height: 40.0,),
        backgroundColor: Constants.addColor,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Constants.blackColor.withOpacity(.5),
        icons:iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),


    );
  }
}


