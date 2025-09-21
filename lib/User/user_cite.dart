// import 'package:flutter/material.dart';
// import 'package:pupsight_app/User/user_info.dart';
// import 'package:pupsight_app/User/user_dashboard.dart';
// import 'package:pupsight_app/User/moreuser.dart';
// import 'package:pupsight_app/User/room_detail.dart';
// import 'package:pupsight_app/User/user_buildinga.dart';
// import 'package:pupsight_app/User/user_buildingb.dart';

// class CiteBuildingPage extends StatelessWidget {
//   const CiteBuildingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final floors = {
//       "1st Floor": [
//         "C101",
//         "C102",
//         "C103",
//         "C104",
//         "C105",
//         "C106",
//         "C107",
//         "C108",
//         "C109",
//         "C110",
//       ],
//       "2nd Floor": [
//         "C201",
//         "C202",
//         "C203",
//         "C204",
//         "C205",
//         "C206",
//         "C207",
//         "C208",
//         "C209",
//         "C210",
//       ],
//       "3rd Floor": [
//         "C301",
//         "C302",
//         "C303",
//         "C304",
//         "C305",
//         "C306",
//         "C307",
//         "C308",
//         "C309",
//         "C310",
//       ],
//       "4th Floor": ["C401", "C402", "C403", "C404", "C405", "C406"],
//     };

//     return Scaffold(
//       appBar: AppBar(title: const Text("CITE Building")),
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
//                             RoomDetailPage(roomName: room, building: "CITE"),
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
