// import 'package:flutter/material.dart';
// import 'package:pupsight_app/User/user_info.dart';
// import 'package:pupsight_app/User/user_dashboard.dart';
// import 'package:pupsight_app/User/moreuser.dart';
// import 'package:pupsight_app/User/room_detail.dart';
// import 'package:pupsight_app/User/user_buildinga.dart';

// class BuildingBPage extends StatelessWidget {
//   const BuildingBPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final floors = {
//       "1st Floor": ["B101", "B102", "B103", "B104", "B105"],
//       "2nd Floor": ["B201", "B202", "B203", "B204", "B205"],
//       "3rd Floor": ["B301", "B302", "B303", "B304", "B305"],
//       "4th Floor": ["AVR"],
//     };

//     return Scaffold(
//       appBar: AppBar(title: const Text("Building B")),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: floors.entries.map((entry) {
//           return Card(
//             elevation: 4,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ExpansionTile(
//               title: Text(entry.key),
//               children: entry.value.map((room) {
//                 return ListTile(
//                   title: Text(room),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             RoomDetailPage(roomName: room, building: "B"),
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           );
//         }).toList(),
//       ),

//       // 🔹 Bottom Navigation Bar with notch
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.yellow,
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.home, color: Colors.black),
//               onPressed: () {
//                 if (ModalRoute.of(context)?.settings.name != '/home') {
//                   Navigator.pushReplacementNamed(context, '/home');
//                 }
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.location_on, color: Colors.black),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const BuildingAPage(),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(width: 48), // space for FAB
//             IconButton(
//               icon: const Icon(Icons.article, color: Colors.black),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => UserInfo()),
//                 );
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.more_horiz, color: Colors.black),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const UserMorePage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
