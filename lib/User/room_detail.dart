import 'package:flutter/material.dart';

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({super.key});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms and Offices"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              // 🔹 Tab bar
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Main Building A"),
                  Tab(text: "Main Building B"),
                  Tab(text: "CITE Campus"),
                ],
              ),
              // 🔹 Search bar below tab
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search rooms...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildRoomListForBuilding("Main Building A"),
          buildRoomListForBuilding("Main Building B"),
          buildRoomListForBuilding("CITE Campus"),
        ],
      ),
    );
  }

  // 🔹 Build ExpansionPanelList for a specific building
  Widget buildRoomListForBuilding(String building) {
    final rooms = getRooms()
        .where(
          (room) =>
              room["building"] == building &&
              room["name"]!.toLowerCase().contains(searchQuery),
        )
        .toList();

    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 4),
        children: rooms.map<ExpansionPanelRadio>((room) {
          return ExpansionPanelRadio(
            value: room["name"]!,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                leading: const Icon(Icons.meeting_room, color: Colors.green),
                title: Text(
                  room["name"]!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
            body: Column(
              children: [
                ListTile(title: Text("Building: ${room["building"]}")),
                ListTile(title: Text("Capacity: ${room["capacity"]}")),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // 🔹 List of all rooms
  List<Map<String, String>> getRooms() {
    return [
      // Main Building A
      {
        "name": "A201",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A202",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A203",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A204",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A205",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A301",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A302",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A303",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A304",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "A305",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "Comlab1",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "Comlab2",
        "building": "Main Building A",
        "capacity": "60 students",
      },
      {
        "name": "Comlab3",
        "building": "Main Building A",
        "capacity": "60 students",
      },

      // Main Building B
      {
        "name": "B201",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B202",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B203",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B204",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B301",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B302",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B303",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "B304",
        "building": "Main Building B",
        "capacity": "60 students",
      },
      {
        "name": "Multimedia Room",
        "building": "Main Building B",
        "capacity": "60 students",
      },

      // CITE Campus
      {"name": "101", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "102", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "103", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "104", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "105", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "106", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "107", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "108", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "109", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "110", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "201", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "202", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "203", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "204", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "205", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "206", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "207", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "208", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "209", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "210", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "211", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "212", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "301", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "302", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "303", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "304", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "305", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "306", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "307", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "308", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "309", "building": "CITE Campus", "capacity": "60 students"},
      {"name": "310", "building": "CITE Campus", "capacity": "60 students"},
      {
        "name": "Student Hall",
        "building": "CITE Campus",
        "capacity": "60 students",
      },
    ];
  }
}
