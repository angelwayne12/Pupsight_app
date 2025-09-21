import 'package:flutter/material.dart';
import 'package:pupsight_app/User/moreuser.dart';
import 'package:pupsight_app/User/user_info.dart';
import 'package:pupsight_app/User/tutorialpage.dart';
import 'package:pupsight_app/User/user_explore.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      // 🔹 Body with video + description
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video placeholder
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.black12,
              child: const Center(
                child: Text(
                  "Video will appear here",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // PUPSIGHT description
            const Text(
              "PUPSIGHT is an Augmented Reality (AR) Navigation and Information App developed for PUP Biñan campuses. It is designed to make campus exploration easier by providing real-time directions, location tracking, and important information straight from a mobile device. With its interactive AR features, students, faculty, and visitors can navigate the campus more confidently and conveniently, ensuring that facilities, offices, and landmarks are easier to find.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 12),
            const Text(
              "Beyond simple navigation, PUPSIGHT also focuses on accessibility and engagement. The system offers multi-language support, offline tours, and a feedback feature to ensure that users have a seamless and informative experience. By blending technology with practical campus needs, PUPSIGHT aims to enhance wayfinding and create a smarter, more connected environment for the PUP Biñan community.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 12),

            // 🔹 "How to Use" hyperlink
            GestureDetector(
              onTap: () {
                // TODO: Navigate to "How to Use" page
                // Example:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HowToUsePage()),
                );
              },
              child: const Text(
                "How to Use",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔹 Floating Action Button (Camera)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add camera functionality
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

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
                if (ModalRoute.of(context)?.settings.name != '/home') {
                  Navigator.pushReplacementNamed(context, '/home');
                }
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfo()),
                );
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
