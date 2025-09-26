import 'package:flutter/material.dart';
import 'package:pupsight_app/User/user_dashboard.dart';
import 'package:pupsight_app/User/moreuser.dart';
import 'package:pupsight_app/User/user_info.dart';
import 'package:pupsight_app/User/building_A_explore.dart';
import 'package:pupsight_app/User/building_B_explore.dart';
import 'package:pupsight_app/User/cite_explore.dart';

class UserExplore extends StatefulWidget {
  const UserExplore({super.key});

  @override
  State<UserExplore> createState() => _UserExploreState();
}

class _UserExploreState extends State<UserExplore> {
  bool showMainCampus = false; // toggle state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 AppBar always says "Explore"
      appBar: AppBar(
        title: const Text("Explore"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      // 🔹 Body
      body: ListView(
        children: [
          const SizedBox(height: 20),

          if (!showMainCampus) ...[
            // Normal view with 2 campuses
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.business),
                title: const Text("PUP Biñan Main Campus"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  setState(() {
                    showMainCampus = true;
                  });
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.computer),
                title: const Text("PUP Biñan CITE Campus"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CiteExplore(),
                    ),
                  );
                },
              ),
            ),
          ] else ...[
            // 🔹 Main Campus view
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        showMainCampus = false;
                      });
                    },
                  ),
                  const Text(
                    "PUP Biñan Main Campus",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text("Old Building (Building A)"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BuildingAExplore()),
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.business),
                title: const Text("New Building (Building B)"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BuildingBExplore()),
                  );
                },
              ),
            ),
          ],
        ],
      ),

      // 🔹 Floating Action Button (Camera)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
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
                if (ModalRoute.of(context)?.settings.name != '/userexplore') {
                  Navigator.pushReplacementNamed(context, '/userexplore');
                }
              },
            ),
            const SizedBox(width: 48), // space for FAB

            IconButton(
              icon: const Icon(Icons.article, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserInfo()),
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
