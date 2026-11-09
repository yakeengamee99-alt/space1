import 'package:flutter/material.dart';
import 'package:space/core/colors/app_colors.dart';
import 'package:space/ui/screens/home_screens.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: -MediaQuery.of(context).size.width * 0.85,
              right: 0,

              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // مسافة علوية
                  const SizedBox(height: 180),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore\nThe\nUniverse',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreens(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red.withValues(alpha: 0.85),
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 56),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_forward, size: 22),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
