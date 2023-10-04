import 'package:flutter/material.dart';
import 'package:some/Activity/Homescreen.dart';
import '../apidata.dart';
import 'SavedScreen.dart';
import '../Activity/ProfileScreen.dart';
import 'package:some/constraints.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0; // To keep track of the selected tab

  final apidata apiData = apidata();

  @override
  Widget build(BuildContext context) {


    apiData.fetchBlogs();
    return Scaffold(
      backgroundColor: kHomeBGColor,
      body: _getBodyWidget(_currentIndex), // Implement this function
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BottomNavigationBar(
            selectedItemColor: kLightColor,
            unselectedItemColor: kLightColor.withOpacity(0.2),
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: kBottomNavBarColor.withOpacity(0.08),
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index; // Update the selected tab
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 25,
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Define a function to return the appropriate content for the selected tab
  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        return Homescreen(apiData); // Replace with your HomeScreen widget
      case 1:
        return SavedScreen(); // Replace with your ProfileScreen widget
      case 2:
        return ProfileScreen();
      default:
        return Homescreen(apiData); // Default to HomeScreen
    }
  }
}
