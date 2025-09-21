import 'package:flutter/material.dart';
import 'package:pupsight_app/User/moreuser.dart';
import 'package:pupsight_app/User/user_info.dart';
import 'package:pupsight_app/User/user_dashboard.dart'; // for back navigation

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({super.key});

  @override
  State<HowToUsePage> createState() => _HowToUsePageState();
}

class _HowToUsePageState extends State<HowToUsePage> {
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
        title: const Text("How to Use"),
        automaticallyImplyLeading: true, // 🔹 adds back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // goes back to previous page
          },
        ),
      ),

      // 🔹 Body with video + steps
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

            // 🔹 Step-by-step instructions
            const Text(
              "Step 1: Download the PUPSIGHT app from Google Play / App Store or scan the campus QR code.\n\n"
              "Step 2: Open the app and allow permissions (Camera for AR, Location for maps).\n\n"
              "Step 3: Search for your destination (e.g., classroom, library, office) using the search bar or tap on the map.\n\n"
              "Step 4: Tap Start AR and hold up your phone to see arrows and directions on the screen.\n\n"
              "Step 5: Follow the arrows and listen to the voice guidance until you reach your destination.\n\n"
              "Step 6: Tap Stop when you arrive, or save the location to your favorites for later.\n\n"
              "Step 7: If offline, download the map first from Menu → Offline Maps before starting navigation.\n\n"
              "Step 8: For feedback or issues, tap Menu → Feedback and report the problem.",
              style: TextStyle(fontSize: 16, height: 1.5),
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
              onPressed: () => _onItemTapped(1),
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
