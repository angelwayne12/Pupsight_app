import 'package:flutter/material.dart';

class PFSInfoPage extends StatefulWidget {
  const PFSInfoPage({super.key});

  @override
  State<PFSInfoPage> createState() => _PFSInfoPageState();
}

class _PFSInfoPageState extends State<PFSInfoPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredProfessors = getProfessors()
        .where(
          (prof) =>
              prof["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
              prof["dept"]!.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Professors, Faculty and Staffs")),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search professor...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: buildProfessorList(filteredProfessors),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Method to build the ExpansionPanelList
  Widget buildProfessorList(List<Map<String, String>> profList) {
    return ExpansionPanelList.radio(
      expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 4),
      children: profList.map<ExpansionPanelRadio>((prof) {
        return ExpansionPanelRadio(
          value: prof["name"]!,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(
                prof["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: Column(
            children: [
              ListTile(title: Text("Department: ${prof["dept"]}")),
              ListTile(title: Text("Email: ${prof["email"]}")),
            ],
          ),
        );
      }).toList(),
    );
  }

  // 🔹 Method at the bottom returning the list of professors
  List<Map<String, String>> getProfessors() {
    return [
      {
        "name": "Prof. Juan Dela Cruz",
        "dept": "IT Dept",
        "email": "juan@pup.edu.ph",
      },
      {
        "name": "Prof. Maria Santos",
        "dept": "Math Dept",
        "email": "maria@pup.edu.ph",
      },
      {
        "name": "Prof. Carlos Reyes",
        "dept": "Physics Dept",
        "email": "carlos@pup.edu.ph",
      },
      {
        "name": "Prof. Ana Dizon",
        "dept": "Biology Dept",
        "email": "ana@pup.edu.ph",
      },
      {
        "name": "Prof. Pedro Garcia",
        "dept": "History Dept",
        "email": "pedro@pup.edu.ph",
      },
      {
        "name": "Prof. Rosa Mendoza",
        "dept": "English Dept",
        "email": "rosa@pup.edu.ph",
      },
      {
        "name": "Prof. Jose Ramirez",
        "dept": "Chemistry Dept",
        "email": "jose@pup.edu.ph",
      },
      {
        "name": "Prof. Liza Aquino",
        "dept": "Philosophy Dept",
        "email": "liza@pup.edu.ph",
      },
      {
        "name": "Prof. Mark Villanueva",
        "dept": "PE Dept",
        "email": "mark@pup.edu.ph",
      },
      {
        "name": "Prof. Grace Lopez",
        "dept": "Business Dept",
        "email": "grace@pup.edu.ph",
      },
    ];
  }
}
