import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class BuildingAExplore extends StatefulWidget {
  const BuildingAExplore({super.key});

  @override
  State<BuildingAExplore> createState() => _BuildingAExploreState();
}

class _BuildingAExploreState extends State<BuildingAExplore> {
  int currentIndex = 0;

  // List of panorama images
  final List<String> panoramas = [
    'assets/panoramas/BuildingA_3rdfloor_01.jpg',
    'assets/panoramas/BuildingA_3rdfloor_02.jpg',
    'assets/panoramas/BuildingA_3rdfloor_03.jpg',
  ];

  void nextPanorama() {
    setState(() {
      if (currentIndex < panoramas.length - 1) currentIndex++;
    });
  }

  void prevPanorama() {
    setState(() {
      if (currentIndex > 0) currentIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Panorama viewer with BoxFit.cover
          PanoramaViewer(
            child: Image.asset(
              panoramas[currentIndex],
              fit: BoxFit.cover, // ensures image fills the view
            ),
            sensorControl: SensorControl.orientation, // tilt optional
          ),

          // Back button at top-left
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 35, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Vertical navigation arrows at bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_upward,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: prevPanorama,
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: nextPanorama,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
