import 'package:flutter/material.dart';
import 'package:space/core/colors/app_colors.dart';
import 'package:space/ui/screens/planetD_screens.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final PageController pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  final List<Map<String, String>> planets = [
    {
      "name": "Earth",
      "image": "assets/images/Earth.png",
      "about":
          "Earth is the only known planet in the universe that supports life. Its unique combination of factors, including liquid water, a breathable atmosphere, and a suitable distance from the Sun, has created the ideal conditions for the development of complex organisms.",
      "distance": "149.6 million km",
      "dayLength": "23.93 hours",
      "orbitalPeriod": "365.25 days",
      "radius": "6371 km",
      "mass": "5.972 × 10²⁴ kg",
      "gravity": "9.81 m/s²",
      "surfaceArea": "510 million km²",
    },
    {
      "name": "Mercury",
      "image": "assets/images/Mercury.png",
      "about":
          "Mercury is the smallest planet in our solar system and the closest planet to the Sun. It has a rocky surface and extreme temperature changes.",
      "distance": "57.9 million km",
      "dayLength": "4222.6 hours",
      "orbitalPeriod": "88 days",
      "radius": "2439.7 km",
      "mass": "3.301 × 10²³ kg",
      "gravity": "3.7 m/s²",
      "surfaceArea": "74.8 million km²",
    },
  ];

  void nextPlanet() {
    if (currentIndex < planets.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPlanet() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void openPlanetDetails() {
    final selectedPlanet = planets[currentIndex];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlanetDetailsScreen(
          planetName: selectedPlanet["name"]!,
          planetImage: selectedPlanet["image"]!,
          about: selectedPlanet["about"]!,
          distance: selectedPlanet["distance"]!,
          dayLength: selectedPlanet["dayLength"]!,
          orbitalPeriod: selectedPlanet["orbitalPeriod"]!,
          radius: selectedPlanet["radius"]!,
          mass: selectedPlanet["mass"]!,
          gravity: selectedPlanet["gravity"]!,
          surfaceArea: selectedPlanet["surfaceArea"]!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
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

          Container(color: AppColors.black.withValues(alpha: 0.25)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 45),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Which Planet\nwould you like to explore?",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: planets.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                planets[index]["image"]!,
                                fit: BoxFit.contain,
                              ),
                            ),

                            const SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: previousPlanet,
                                  icon: const Icon(
                                    Icons.arrow_circle_left,
                                    color: AppColors.red,
                                    size: 35,
                                  ),
                                ),

                                Text(
                                  planets[index]["name"]!,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),

                                IconButton(
                                  onPressed: nextPlanet,
                                  icon: const Icon(
                                    Icons.arrow_circle_right,
                                    color: AppColors.red,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: openPlanetDetails,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Explore ${planets[index]["name"]}",
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
