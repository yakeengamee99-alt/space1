import 'package:flutter/material.dart';
import 'package:space/core/colors/app_colors.dart';

class PlanetDetailsScreen extends StatelessWidget {
  final String planetName;
  final String planetImage;
  final String about;
  final String distance;
  final String dayLength;
  final String orbitalPeriod;
  final String radius;
  final String mass;
  final String gravity;
  final String surfaceArea;

  const PlanetDetailsScreen({
    super.key,
    required this.planetName,
    required this.planetImage,
    required this.about,
    required this.distance,
    required this.dayLength,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff10121B),

      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Positioned(
              top: -80,
              right: 0,
              left: 0,
              child: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  "assets/images/background.jpg",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,

              child: Center(
                child: Text(
                  planetName,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: .bold,
                  ),
                ),
              ),
            ),

            // Page Content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_circle_left,
                        color: Color(0xffF27D7D),
                        size: 35,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Planet Image
                    Center(
                      child: Image.asset(
                        planetImage,
                        height: 230,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Planet Name
                    const SizedBox(height: 30),

                    // About
                    const Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      about,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Planet Information
                    buildInfo('Distance from Sun (km)', distance),
                    buildInfo('Length of Day (hours)', dayLength),
                    buildInfo('Orbital Period (Earth years)', orbitalPeriod),
                    buildInfo('Radius (km)', radius),
                    buildInfo('Mass (kg)', mass),
                    buildInfo('Gravity (m/s²)', gravity),
                    buildInfo('Surface Area (km²)', surfaceArea),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '$title:',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
