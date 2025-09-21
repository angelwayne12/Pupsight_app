import 'package:flutter/material.dart';
import 'package:pupsight_app/User/user_info.dart';
import 'package:pupsight_app/User/user_dashboard.dart';
import 'package:pupsight_app/User/moreuser.dart';
import 'package:pupsight_app/User/room_detail.dart';
import 'package:pupsight_app/User/user_buildingb.dart';

class BuildingAPage extends StatelessWidget {
  const BuildingAPage({super.key});

  @override
  Widget build(BuildContext context) {
    final floors = {
      "1st Floor": ["A101", "A102", "A103", "A104", "A105"],
      "2nd Floor": ["A201", "A202", "A203", "A204", "A205"],
      "3rd Floor": ["A301", "A302", "A303", "A304", "A305"],
      "4th Floor": ["A401", "A402", "A403", "A404", "A405"],
      "5th Floor": ["A501", "A502", "A503", "A504", "A505"],
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Building A")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: floors.entries.map((entry) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ExpansionTile(
              title: Text(entry.key),
              // children: entry.value.map((room) {
              //   return ListTile(
              //     title: Text(room),
              //     onTap: () {
              //       // <-- this is the correct call (matches the RoomDetailPage below)
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) =>
              //               RoomDetailPage(roomName: room, building: "A"),
              //         ),
              //       );
              //     },
              //   );
              // }).toList(),
            ),
          );
        }).toList(),
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
                  MaterialPageRoute(builder: (context) => UserDashboard()),
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
