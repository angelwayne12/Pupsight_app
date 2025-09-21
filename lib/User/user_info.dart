import 'package:flutter/material.dart';
import 'package:pupsight_app/User/room_detail.dart';
import 'package:pupsight_app/User/user_dashboard.dart';
import 'package:pupsight_app/User/moreuser.dart';
import 'package:pupsight_app/User/user_pfsinfo.dart';
import 'package:pupsight_app/User/user_explore.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 AppBar with yellow background
      appBar: AppBar(
        title: const Text("User Information"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      // 🔹 Body with two settings-style buttons
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Professors, Faculty and Staffs"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PFSInfoPage()),
                );
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.meeting_room),
              title: const Text("Rooms and Offices"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RoomDetailPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 🔹 Floating Action Button (Camera) slightly lower
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10), // move FAB lower
        child: FloatingActionButton(
          onPressed: () {
            // TODO: Add camera functionality
          },
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
          child: const Icon(Icons.camera_alt, color: Colors.white),
        ),
      ),

      // 🔹 Bottom Navigation Bar with notch
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserDashboard(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserExplore()),
                );
              },
            ),
            const SizedBox(width: 48), // space for FAB

            IconButton(
              icon: const Icon(Icons.article, color: Colors.black),
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != '/userinfo') {
                  Navigator.pushReplacementNamed(context, '/userinfo');
                }
              },
            ),

            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserMorePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
