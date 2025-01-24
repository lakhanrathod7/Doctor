import 'package:doctor/pages/home_page.dart';
import 'package:doctor/pages/profile_page.dart';
import 'package:doctor/pages/search_page.dart';
import 'package:flutter/material.dart';

import '../pages/appointment_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List screenList = [
      HomePage(),
      SearchPage(),
      AppointmentPage(),
      ProfilePage()
    ];
    return Scaffold(
      body: screenList[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF111418),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.grey,
          currentIndex: currentindex, // Current selected index
          onTap: (index) {
            setState(() {
              currentindex = index; // Update index on tap
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book_online_outlined,
              ),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile',
            ),
          ]),
    );
  }
}
