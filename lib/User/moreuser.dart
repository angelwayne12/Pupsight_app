import 'package:flutter/material.dart';
import 'package:pupsight_app/User/user_info.dart';
import 'package:pupsight_app/User/user_dashboard.dart';
import 'package:pupsight_app/User/user_explore.dart';

class UserMorePage extends StatefulWidget {
  const UserMorePage({super.key});

  @override
  State<UserMorePage> createState() => _UserMorePageState();
}

class _UserMorePageState extends State<UserMorePage> {
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
        title: const Text("More"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2x2 grid
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildNeuButton(
              "Edit Profile",
              Icons.person_outline,
              const EditProfilePage(),
            ),
            _buildNeuButton(
              "User Agreements",
              Icons.assignment,
              const UserAgreementsPage(),
            ),
            _buildNeuButton("Feedback", Icons.comment, const FeedbackPage()),
            _buildNeuButton("Log Out", Icons.logout, const LogoutPage()),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserMorePage()),
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
                if (ModalRoute.of(context)?.settings.name != '/more') {
                  Navigator.pushReplacementNamed(context, '/more');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNeuButton(String text, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(6, 6),
              blurRadius: 10,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-6, -6),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black, size: 40),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Placeholder pages for navigation
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Edit Profile")));
}

class UserAgreementsPage extends StatelessWidget {
  const UserAgreementsPage({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("User Agreements")));
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Feedback")));
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Log out")));
}
